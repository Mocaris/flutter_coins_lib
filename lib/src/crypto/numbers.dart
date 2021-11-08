import 'dart:typed_data';

import 'package:sprintf/sprintf.dart';
import 'package:web3dart/crypto.dart';

Uint8List hexStringToByteArray(String input) {
  var cleanInput = strip0x(input);

  var len = cleanInput.length;

  if (len == 0) {
    return Uint8List(0);
  }
  Uint8List data;
  int startIdx;
  if (len % 2 != 0) {
    data = Uint8List((len ~/ 2) + 1);
    data[0] = digitHex(cleanInput[0]);
    startIdx = 1;
  } else {
    data = Uint8List((len ~/ 2));
    startIdx = 0;
  }
  for (var i = startIdx; i < len; i += 2) {
    data[(i + 1) ~/ 2] = (digitHex(cleanInput[i]) << 4) + digitHex(cleanInput[i + 1]);
  }
  return data;
}

int digitHex(String hex) {
  var char = hex.codeUnitAt(0);
  if (char >= '0'.codeUnitAt(0) && char <= '9'.codeUnitAt(0) ||
      char >= 'a'.codeUnitAt(0) && char <= 'f'.codeUnitAt(0)) {
    return int.parse(hex, radix: 16);
  } else {
    return -1;
  }
}


String toHexString(Uint8List bytes, int offset, int length, bool withPrefix) {
  var stringBuilder = '';
  if (withPrefix) {
    stringBuilder += '0x';
  }
  for (var i = offset; i < offset + length; i++) {
    stringBuilder += sprintf.call('%02x', [bytes[i] & 0xFF]);
  }
  return stringBuilder;
}