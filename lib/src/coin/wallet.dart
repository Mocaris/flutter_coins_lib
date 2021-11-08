import 'dart:async';
import 'dart:typed_data';
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
export 'package:bip39/bip39.dart';

// m / purpose' / coin' / account' / change / address_index
abstract class CoinWallet {
  final String mnemonicWords;
  final String passphrase;
  final bip32.BIP32 bip32Wallet;
  final bool mainNet;

  FutureOr<String> generateAddress();

  BigInt get privateKeyInt;

  Uint8List get privateKey;

  CoinWallet(this.mnemonicWords, {this.passphrase = '', this.mainNet = true})
      : bip32Wallet = bip32.BIP32.fromSeed(bip39.mnemonicToSeed(mnemonicWords, passphrase: passphrase), netWorkType(mainNet)) {
    if (!bip39.validateMnemonic(mnemonicWords)) {
      throw Exception('Mnemonic word validation failed');
    }
  }

  String getCoinPath({int purpose = 44, required int coinIndex, int account = 0, int change = 0, int addrIndex = 0}) =>
      "m/$purpose'/$coinIndex'/$account'/$change/$addrIndex";

  bool addressValid(String address);
}

bip32.NetworkType netWorkType(bool mainNet) => mainNet ? _btcMainNet : _btcTestNet;

int btcPubKeyHash(bool mainNet) => mainNet ? _btcPubKeyHash : _btcTestPubKeyHash;

final _btcMainNet = bip32.NetworkType(bip32: bip32.Bip32Type(public: 0x0488b21e, private: 0x0488ade4), wif: 0x80);
final _btcPubKeyHash = 0x00;
final _btcTestNet = bip32.NetworkType(bip32: bip32.Bip32Type(public: 0x043587cf, private: 0x04358394), wif: 0xef);
final _btcTestPubKeyHash = 0x6f;

/*

final bitcoin = NetworkType(
    messagePrefix: '\x18Bitcoin Signed Message:\n',
    bech32: 'bc',
    bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
    pubKeyHash: 0x00,
    scriptHash: 0x05,
    wif: 0x80);

final testnet = NetworkType(
    messagePrefix: '\x18Bitcoin Signed Message:\n',
    bech32: 'tb',
    bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
    pubKeyHash: 0x6f,
    scriptHash: 0xc4,
    wif: 0xef);
*/
