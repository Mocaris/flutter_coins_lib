import 'dart:typed_data';

import 'package:flutter_coins_lib/bitcoin_flutter/bitcoin_flutter.dart';
import 'package:flutter_coins_lib/wallet_hd/src/rlp.dart';
import 'package:flutter_coins_lib/wallet_hd/src/wallet_config.dart';
import 'package:web3dart/crypto.dart';
import 'package:bech32/bech32.dart';
import 'package:bs58check/bs58check.dart' as bs58check;

import 'p2sh.dart';

class BitcoinIn {
  String txHash;
  int outputNo;
  num value;

  BitcoinIn(this.txHash, this.outputNo, this.value);
}

class Btransaction {
  TransactionBuilder txb;
  NetworkType network;

  Btransaction(this.txb, this.network);
}

class BitcoinTransaction {
  static Future<String?> signBitcoinTransaction(String privateKey, Btransaction transaction) async {
    try {
      var ecPair = ECPair.fromWIF(privateKey, network: transaction.network);
      transaction.txb.inputs.forEach((element) {
        var index = transaction.txb.inputs.indexOf(element);
        transaction.txb.sign(vin: index, keyPair: ecPair);
      });
      var tx = transaction.txb.buildIncomplete();
      var hex = tx.toHex();
      return hex;
    } catch (e) {
      print('BitcoinTransaction.signBitcoinTransaction error : $e');
    }
    return null;
  }

  // 6a = 106 OP_RETURN
  // 14 = 20
  // 6f6d6e69 = omni
  static const _omni = '6a146f6d6e69';
  static final BigInt dirt = BigInt.from(546);

  static String _fillLengthWith(String s, {int length = 16, String char = '0'}) {
    if (s == null) return '';
    if (s.length >= length) return s.substring(0, length);
    return (char * length + s).substring(s.length);
  }

  static String _createOmniPayload(BigInt value, int contract) {
    var type = contract.toRadixString(16);
    var valueHex = value.toRadixString(16);
    var payload = _omni + _fillLengthWith(type) + _fillLengthWith(valueHex);
    return payload;
  }

  static Future<Btransaction?> createBitcoinTransaction(String from, String to, num value, num fee,
      {String type = 'BTC', required List<BitcoinIn> unspends}) async {
    if (WalletConfig.bitcoinType.keys.contains(type) && unspends != null && unspends.isNotEmpty) {
      var coinInfo = WalletConfig.bitcoinType[type]!;

      final txb = TransactionBuilder(network: coinInfo.network as NetworkType);
      var coinFee = numPow2BigInt(fee, coinInfo.decimals);
      var coinValue = numPow2BigInt(value, coinInfo.decimals);

      var amount = BigInt.zero;
      unspends.forEach((element) {
        amount += numPow2BigInt(element.value, coinInfo.decimals);
        txb.addInput(element.txHash, element.outputNo);
      });
      var change = amount - coinValue - coinFee;
      print("amount:$amount");
      print("coinValue:$coinValue");
      print("coinFee:$coinFee");
      print("change:$change");
      if (change < BigInt.zero) {
        print('Amount is not enough.');
      } else {
        if (change >= dirt) {
          var fromAddr = addressToOutputScript(from, coinInfo.network as NetworkType);
          // 找零给自己 | Get change for yourself
          txb.addOutput(fromAddr, change.toInt());
        }

        var toAddr = addressToOutputScript(to, coinInfo.network as NetworkType);
        print(toAddr);
        // 转给别人 | Transfer to others
        txb.addOutput(toAddr, coinValue.toInt());
        return Btransaction(txb, coinInfo.network as NetworkType);
      }
    }
    return null;
  }

  static Future<Btransaction?> createOmniTransaction(String from, String to, num value, num fee,
      {String type = 'USDT', required List<BitcoinIn> unspends}) async {
    if (WalletConfig.omniType.keys.contains(type)) {
      var coinInfo = WalletConfig.omniType[type]!;
      try {
        final txb = TransactionBuilder(network: coinInfo.network as NetworkType);
        const decimals = 8;
        var coinFee = numPow2BigInt(fee, decimals);

        var amount = BigInt.zero;
        unspends.forEach((element) {
          amount += numPow2BigInt(element.value, decimals);
          txb.addInput(element.txHash, element.outputNo);
        });
        var change = amount - dirt - coinFee;
        if (change < BigInt.zero) {
          print('Amount is not enough.');
        } else {
          if (change >= dirt) {
            var fromAddr = addressToOutputScript(from, coinInfo.network as NetworkType);
            // 找零给自己 | Get change for yourself
            txb.addOutput(fromAddr, change.toInt());
          }

          var toAddr = addressToOutputScript(to, coinInfo.network as NetworkType);
          print("toAddr");
          print(toAddr);
          txb.addOutput(toAddr, dirt.toInt());

          var bigValue = numPow2BigInt(value, coinInfo.decimals);
          var contract = num.parse(coinInfo.address!).toInt();
          var payload = _createOmniPayload(bigValue, contract);
          print("payload");
          print(payload);

          txb.addOutput(hexToBytes(payload), 0);

          return Btransaction(txb, coinInfo.network as NetworkType);
        }
      } catch (e) {
        print('BitcoinTransaction.createOmniTransaction error : $e');
      }
    }
    return null;
  }

  static Uint8List? addressToOutputScript(String address, [NetworkType? nw]) {
    var network = nw ?? bitcoin;
    var decodeBase58;
    var decodeBech32;
    try {
      decodeBase58 = bs58check.decode(address);
    } catch (err) {}
    if (decodeBase58 != null) {
      if (decodeBase58[0] == network.pubKeyHash) {
        var p2pkh = P2PKH(data: PaymentData(address: address), network: network);
        return p2pkh.data.output;
      }
      if (decodeBase58[0] == network.scriptHash) {
        var p2sh = P2SH(data: PaymentData(address: address), network: network);
        return p2sh.data.output;
      }
    } else {
      try {
        decodeBech32 = segwit.decode(address);
      } catch (err) {}
      if (decodeBech32 != null) {
        if (network.bech32 != decodeBech32.hrp) throw ArgumentError('Invalid prefix or Network mismatch');
        if (decodeBech32.version != 0) throw ArgumentError('Invalid address version');
        var p2wpkh = P2WPKH(data: PaymentData(address: address), network: network);
        return p2wpkh.data.output;
      }
    }
    throw ArgumentError(address + ' has no matching Script');
  }
}
