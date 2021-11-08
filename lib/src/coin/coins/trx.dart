import 'dart:typed_data';

import 'package:base58check/base58.dart';
import 'package:base58check/base58check.dart';
import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:crypto/crypto.dart' as crypto;
import 'package:crypton/crypton.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/crypto.dart';

import '../wallet.dart';

class TrxWallet extends CoinWallet {
  static final int addressPreFixByte = 65;

  TrxWallet(String mnemonicWords, {String passphrase = ''}) : super(mnemonicWords, passphrase: passphrase);

  @override
  Uint8List get privateKey => bip32Wallet.derivePath(getCoinPath(coinIndex: 195)).privateKey!;

  @override
  BigInt get privateKeyInt => bytesToUnsignedInt(privateKey);

  //m/44'/195'/0'/0/0
  //TSDmRJNfENV3dN4HnKaJ2zEpfXiQ38hsUe
  @override
  String generateAddress() {
    var privateKey = HEX.encode(bip32Wallet.derivePath(getCoinPath(coinIndex: 195)).privateKey!);
    var ecPrivateKey = ECPrivateKey.fromString(privateKey);
    var ecPoint = ecPrivateKey.publicKey.Q.asPointyCastle;
    var pubBytes = ecPoint.getEncoded(false);
    var keyAddress = _sha3omit12(pubBytes.sublist(1));
    var address = _encode58Check(keyAddress);
    return address;
  }

  String _encode58Check(Uint8List input) {
    var hash0 = Uint8List.fromList(crypto.sha256.convert(input).bytes);
    var hash1 = Uint8List.fromList(crypto.sha256.convert(hash0).bytes);
    var inputCheck = Uint8List(input.length + 4);
    inputCheck.setRange(0, input.length, input);
    inputCheck.setRange(input.length, input.length + 4, hash1);
    return Base58Encoder(Base58CheckCodec.BITCOIN_ALPHABET).convert(inputCheck);
  }

  Uint8List _sha3omit12(Uint8List input) {
    var hash = keccak256(input);
    var address = hash.sublist(11, hash.length);
    address[0] = addressPreFixByte;
    return Uint8List.fromList(address);
  }

/*  @override
  FutureOr<String> signTransation(String inputTransaction, String toAddr) {
    throw UnimplementedError();
  }*/

  static bool validAddress(String address) {
    try {
      var decode = bs58check.decode(address);
      if (decode.length != 21) {
        return false;
      }
      return decode[0] == addressPreFixByte;
    } catch (e, s) {
      return false;
    }
  }

  @override
  bool addressValid(String address) {
    return validAddress(address);
  }

}
