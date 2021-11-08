import 'dart:typed_data';
import 'dart:convert';
import '../../src/crypto.dart';
import 'varuint.dart';
import '../../src/models/networks.dart';

Uint8List magicHash(String message, [NetworkType? network]) {
  network ??= bitcoin;
  var messagePrefix = Uint8List.fromList(utf8.encode(network.messagePrefix));
  var messageVISize = encodingLength(message.length);
  var length = messagePrefix.length + messageVISize + message.length;
  var buffer = Uint8List(length);
  buffer.setRange(0, messagePrefix.length, messagePrefix);
  encode(message.length, buffer, messagePrefix.length);
  buffer.setRange(messagePrefix.length + messageVISize, length, utf8.encode(message));
  return hash256(buffer);
}
