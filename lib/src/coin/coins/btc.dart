import 'dart:typed_data';

import 'package:bech32/bech32.dart';
import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:flutter_coins_lib/bitcoin_flutter/src/crypto.dart';
import 'package:web3dart/crypto.dart';

import '../wallet.dart';

class BtcWallet extends CoinWallet {
  BtcWallet(String mnemonicWords, {String passphrase = '', bool mainNet = true})
      : super(mnemonicWords, passphrase: passphrase, mainNet: mainNet);

  @override
  Uint8List get privateKey => bip32Wallet.derivePath(getCoinPath(coinIndex: mainNet ? 0 : 1)).privateKey!;

  @override
  BigInt get privateKeyInt => bytesToUnsignedInt(privateKey);

  //  m / purpose' / coin' / account' / change / address_index
  //1GE28szQ2PEgbZdQgGefdt5yQ3BsBmMpDr
  //m/44'/0'/0'/0/0
  @override
  String generateAddress() {
    var pubkey = bip32Wallet.derivePath(getCoinPath(coinIndex: mainNet ? 0 : 1)).publicKey;
    var hash = hash160(pubkey);
    final payload = Uint8List(21);
    payload.buffer.asByteData().setUint8(0, btcPubKeyHash(mainNet));
    payload.setRange(1, payload.length, hash);
    var address = bs58check.encode(payload);
    return address;
  }

  static bool validAddress(String address, {bool mainNet = true}) {
    try {
      var decode = bs58check.decode(address);
      return decode[0] == btcPubKeyHash(mainNet);
    } catch (e, s) {
      try {
        return segwit.decode(address).hrp == 'bc';
      } catch (e, s) {
        return false;
      }
    }
  }

  @override
  bool addressValid(String address) {
    return validAddress(address);
  }

/* @override
  FutureOr<String> signTransation(String inputTransaction, String toAddr) {
    final seedHex = HEX.decode(inputTransaction);
    return "";
  }*/
}
