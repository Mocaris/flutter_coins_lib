import 'dart:typed_data';

import 'package:crypton/crypton.dart' as crypton;
import 'package:flutter_coins_lib/src/coin/wallet.dart';
import 'package:flutter_coins_lib/src/crypto/base32.dart';
import 'package:flutter_coins_lib/src/crypto/numbers.dart';
import 'package:hex/hex.dart';
import 'package:pointycastle/export.dart';
import 'package:web3dart/crypto.dart';

class FilWallet extends CoinWallet {
  FilWallet(String mnemonicWords, {String passphrase = ''}) : super(mnemonicWords, passphrase: passphrase);

  //m/44'/461'/0'/0/0
  @override
  String generateAddress() {
    var privateKey = HEX.encode(bip32Wallet.derivePath(getCoinPath(coinIndex: 461)).privateKey!);
    var ecPrivateKey = crypton.ECPrivateKey.fromString(privateKey);
    var ecPoint = ecPrivateKey.publicKey.Q.asPointyCastle;
    var pubKeyBytes = ecPoint.getEncoded(false);
    var blake2bDigest = Blake2bDigest(digestSize: 20);
    var blakeHashBytes = blake2bDigest.process(pubKeyBytes);
    var hexString = toHexString(blakeHashBytes, 0, blakeHashBytes.length, false);
    var black2HashSecond = '0x01$hexString';
    var blake2bDigest2 = Blake2bDigest(digestSize: 4);
    var black2HashString = hexStringToByteArray(black2HashSecond);
    var checksumBytes = blake2bDigest2.process(black2HashString);
    var addressBytes = Uint8List(blakeHashBytes.length + checksumBytes.length);
    addressBytes.setRange(0, blakeHashBytes.length, blakeHashBytes);
    addressBytes.setRange(blakeHashBytes.length, addressBytes.length, checksumBytes);
    //f 正式 t 测试 1 钱包 2 合约
    return 'f1' + base32.encode(addressBytes).toLowerCase();
  }

/*

  @override
  FutureOr<String> signTransation(String inputTransaction, String toAddr) {
    throw UnimplementedError();
  }
*/

  static bool validAddress(String address) {
    return address.startsWith(r'f1');
  }

  @override
  Uint8List get privateKey => bip32Wallet.derivePath(getCoinPath(coinIndex: 461)).privateKey!;

  @override
  BigInt get privateKeyInt => bytesToUnsignedInt(privateKey);
}
