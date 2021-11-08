import 'dart:async';
import 'dart:typed_data';

import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';

import '../wallet.dart';

class EthWallet extends CoinWallet {
  EthWallet(String mnemonicWords, {String passphrase = ''}) : super(mnemonicWords, passphrase: passphrase);

  //0x640883c1b7a03b3484d9200b811a6f920e61cf78
  //m/44'/60'/0'/0/0
  @override
  Future<String> generateAddress() async {
    var extractAddress = await _getECKey().extractAddress();
    var address = extractAddress.toString();
    return address;
  }

  EthPrivateKey _getECKey() {
    var privateKey = HEX.encode(bip32Wallet.derivePath(getCoinPath(coinIndex: 60)).privateKey!);
    return EthPrivateKey.fromHex(privateKey);
  }

  bool validAddress(String address) {
    var temp = address;
    if (address.startsWith(r'0x')) {
      temp = address.substring(2);
      try {
        BigInt.parse(temp, radix: 16);
      } catch (e, s) {
        return false;
      }
    }
    return temp.length == 160 >> 2;
  }

  @override
  Uint8List get privateKey => _getECKey().privateKey;

  @override
  BigInt get privateKeyInt => _getECKey().privateKeyInt;
/*@override
  FutureOr<String> signTransation(String inputTransaction, String toAddr) {

    return "";
  }*/
/*@override
  FutureOr<String> signTransation(String inputTransaction, String toAddr) {
    var trans = jsonDecode(inputTransaction);
    var nonce = BigInt.parse(trans['nonce'].toString());
    var gasPrice = BigInt.parse(trans['gasPrice'].toString());
    var gasLimit = BigInt.parse(trans['gasLimit'].toString());
    var value = BigInt.parse(trans['value'].toString());
    var data = trans['data'];
    var to = trans['to'];
    return "";
  }*/
}
