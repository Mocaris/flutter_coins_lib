library wallet_hd;

import 'package:bip39/bip39.dart' as bip39;
import 'src/bitcoin_transaction.dart';
import 'src/ethereum_transaction.dart';
import 'src/wallet_config.dart';
import '../bitcoin_flutter/bitcoin_flutter.dart' as bitcoin_flutter;
import 'package:web3dart/web3dart.dart';

/// BTC转账
export 'src/bitcoin_transaction.dart';

/// ETH转账
export 'src/ethereum_transaction.dart';
export 'src/rsa_proxy.dart';

class WalletHd {
  /// 创建随机助记词 | Create Random Mnemonic
  static String createRandomMnemonic() {
    var randomMnemonic = bip39.generateMnemonic();
    return randomMnemonic;
  }

  /// 导入助记词，返回[btc地址 , eth地址] | Import mnemonic words and return [btc address, eth address]
  static Future<Map<String, String>> getAccountAddress(String mnemonic, {String? derivePath}) async {
    var btcPath = (derivePath != null && derivePath.isNotEmpty) ? derivePath : WalletConfig.bitcoinType['BTC']!.path;
    var hdWalletBtc = bitcoin_flutter.HDWallet.fromSeed(bip39.mnemonicToSeed(mnemonic)).derivePath(btcPath);
    var btcAddress = hdWalletBtc.address!;

    var ethPath = (derivePath != null && derivePath.isNotEmpty) ? derivePath : WalletConfig.ethereumType['ETH']!.path;
    var ethPrivateKey = ethMnemonicToPrivateKey(mnemonic, derivePath: ethPath);
    var ethAddr = await ethPrivateKey.extractAddress();
    var ethAddress = ethAddr.toString();

    return {"BTC": btcAddress, "ETH": ethAddress};
  }

  /// ETH 导入助记词返回私钥 | ETH import mnemonic phrase and return private key
  static EthPrivateKey ethMnemonicToPrivateKey(String mnemonic, {String? derivePath}) {
    var ethPath = (derivePath != null && derivePath.isNotEmpty) ? derivePath : WalletConfig.ethereumType['ETH']!.path;
    var hdWalletEth = bitcoin_flutter.HDWallet.fromSeed(bip39.mnemonicToSeed(mnemonic)).derivePath(ethPath);

    var privateKey = hdWalletEth.privKey!;

    var ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    return ethPrivateKey;
  }

  /// BTC 导入助记词返回私钥wif | BTC import mnemonic phrase and return private key wif
  static String? btcMnemonicToPrivateKey(String mnemonic, {String? derivePath}) {
    /// BTC 普通地址 | Ordinary address
    var btcPath = (derivePath != null && derivePath.isNotEmpty) ? derivePath : WalletConfig.bitcoinType['BTC']!.path;
    var hdWalletBtc = bitcoin_flutter.HDWallet.fromSeed(bip39.mnemonicToSeed(mnemonic)).derivePath(btcPath);
    return hdWalletBtc.wif;
  }

  /// BTC转账 | BTC transfer
  static Future<String?> transactionBTC(
    String mnemonic,
    String fromAddress,
    String toAddress,
    String amount,
    num fee,
    List<BitcoinIn> unspand,
  ) async {
    var privateKey = btcMnemonicToPrivateKey(mnemonic)!;
    var btransaction = await BitcoinTransaction.createBitcoinTransaction(
        fromAddress, toAddress, double.parse(amount), fee,
        unspends: unspand);
    var txPack = await BitcoinTransaction.signBitcoinTransaction(privateKey, btransaction!);
    return txPack;
  }

  /// ETH转账 | ETH transfer
  static Future<String?> transactionETH(
    String mnemonic,
    String fromAddress,
    String toAddress,
    String amount,
    String gasPrice,
    int nonce,
  ) async {
    var ethPrivateKey = ethMnemonicToPrivateKey(mnemonic);

    var transaction =
        await EthereumTransaction.createEthereumTransaction(fromAddress, toAddress, amount, gasPrice, nonce);

    var txPack = await EthereumTransaction.signEthereumTransaction(ethPrivateKey, transaction);

    return txPack;
  }

  /// ERC20USDT转账 | ERC20USDT transfer
  static Future<String?> transactionERC20USDT(
    String mnemonic,
    String fromAddress,
    String toAddress,
    String amount,
    String gasPrice,
    int nonce,
  ) async {
    var ethPrivateKey = ethMnemonicToPrivateKey(mnemonic);

    var transaction =
        await EthereumTransaction.createErc20Transaction(fromAddress, toAddress, amount, gasPrice, nonce);

    var txPack = await EthereumTransaction.signEthereumTransaction(ethPrivateKey, transaction);

    return txPack;
  }
}
