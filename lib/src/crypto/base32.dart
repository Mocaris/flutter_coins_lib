import 'dart:typed_data';

// class base32 {
//   static final base32Chars = 'abcdefghijklmnopqrstuvwxyz234567';
//   static final base32Lookup = <int>[
//     0xFF, 0xFF, 0x1A, 0x1B, 0x1C,
//     0x1D, 0x1E, 0x1F, // '0', '1', '2', '3', '4', '5', '6', '7'
//     0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, // '8', '9', ':',
//     // ';', '<', '=',
//     // '>', '?'
//     0xFF, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, // '@', 'A', 'B',
//     // 'C', 'D', 'E',
//     // 'F', 'G'
//     0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, // 'H', 'I', 'J',
//     // 'K', 'L', 'M',
//     // 'N', 'O'
//     0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, // 'P', 'Q', 'R',
//     // 'S', 'T', 'U',
//     // 'V', 'W'
//     0x17, 0x18, 0x19, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, // 'X', 'Y', 'Z',
//     // '[', '', ']',
//     // '^', '_'
//     0xFF, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, // '`', 'a', 'b',
//     // 'c', 'd', 'e',
//     // 'f', 'g'
//     0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, // 'h', 'i', 'j',
//     // 'k', 'l', 'm',
//     // 'n', 'o'
//     0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, // 'p', 'q', 'r',
//     // 's', 't', 'u',
//     // 'v', 'w'
//     0x17, 0x18, 0x19, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF // 'x', 'y', 'z',
//     // '{', '|', '}',
//     // '~', 'DEL'
//   ];
//
//   ///////
//   /// Encodes byte array to Base32 String.
//   ///
//   /// @param bytes
//   ///            Bytes to encode.
//   /// @return Encoded byte array <code>bytes</code> as a String.
//   ///
//   ////
//   static String encode(final Uint8List bytes) {
//     var i = 0, index = 0, digit = 0;
//     int currByte, nextByte;
//     var base32 = StringBuffer((bytes.length + 7) * 8 ~/ 5);
//     while (i < bytes.length) {
//       currByte = (bytes[i] >= 0) ? bytes[i] : (bytes[i] + 256); // unsign
//       /* Is the current digit going to span a byte boundary? */
//       if (index > 3) {
//         if ((i + 1) < bytes.length) {
//           nextByte = (bytes[i + 1] >= 0) ? bytes[i + 1] : (bytes[i + 1] + 256);
//         } else {
//           nextByte = 0;
//         }
//         digit = currByte & (0xFF >> index);
//         index = (index + 5) % 8;
//         digit <<= index;
//         digit |= nextByte >> (8 - index);
//         i++;
//       } else {
//         digit = (currByte >> (8 - (index + 5))) & 0x1F;
//         index = (index + 5) % 8;
//         if (index == 0) i++;
//       }
//       base32.write(base32Chars[digit]);
//     }
//     return base32.toString();
//   }
//
//   /// Decodes the given Base32 String to a raw byte array.
//   ///
//   /// @param base32
//   /// @return Decoded <code>base32</code> String as a raw byte array.
//   static List<int> decode1(final String base32) {
//     int i, index, lookup, offset, digit;
//     var bytes = Uint8List(base32.length * 5 ~/ 8);
//     index = 0;
//     offset = 0;
//     for (i = 0; i < base32.length; i++) {
//       lookup = base32.codeUnitAt(i) - 48; //char '0'
//       /* Skip chars outside the lookup table */
//       if (lookup < 0 || lookup >= base32Lookup.length) {
//         continue;
//       }
//       digit = base32Lookup[lookup];
//       /* If this digit is not in the table, ignore it */
//       if (digit == 0xFF) {
//         continue;
//       }
//       if (index <= 3) {
//         index = (index + 5) % 8;
//         if (index == 0) {
//           bytes[offset] |= digit;
//           offset++;
//           if (offset >= bytes.length) {
//             break;
//           }
//         } else {
//           bytes[offset] |= digit << (8 - index);
//         }
//       } else {
//         index = (index + 5) % 8;
//         bytes[offset] |= (digit >> index);
//         offset++;
//         if (offset >= bytes.length) {
//           break;
//         }
//         bytes[offset] |= digit << (8 - index);
//       }
//     }
//     return bytes;
//   }
//
// }
class base32 {
  /// Takes in a [byteList] converts it to a Uint8List so that I can run
  /// bit operations on it, then outputs a [String] representation of the
  /// base32.
  static String encode(Uint8List bytesList) {
    var i = 0;
    var count = (bytesList.length ~/ 5) * 5;
    var base32str = '';
    while (i < count) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i++];
      var v3 = bytesList[i++];
      var v4 = bytesList[i++];
      var v5 = bytesList[i++];

      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4 | v3 >> 4) & 31] +
          _base32Chars[(v3 << 1 | v4 >> 7) & 31] +
          _base32Chars[(v4 >> 2) & 31] +
          _base32Chars[(v4 << 3 | v5 >> 5) & 31] +
          _base32Chars[v5 & 31];
    }

    var remain = bytesList.length - count;
    if (remain == 1) {
      var v1 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] + _base32Chars[(v1 << 2) & 31];
    } else if (remain == 2) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] + _base32Chars[(v1 << 2 | v2 >> 6) & 31] + _base32Chars[(v2 >> 1) & 31] + _base32Chars[(v2 << 4) & 31];
    } else if (remain == 3) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i++];
      var v3 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4 | v3 >> 4) & 31] +
          _base32Chars[(v3 << 1) & 31];
    } else if (remain == 4) {
      var v1 = bytesList[i++];
      var v2 = bytesList[i++];
      var v3 = bytesList[i++];
      var v4 = bytesList[i];
      base32str += _base32Chars[v1 >> 3] +
          _base32Chars[(v1 << 2 | v2 >> 6) & 31] +
          _base32Chars[(v2 >> 1) & 31] +
          _base32Chars[(v2 << 4 | v3 >> 4) & 31] +
          _base32Chars[(v3 << 1 | v4 >> 7) & 31] +
          _base32Chars[(v4 >> 2) & 31] +
          _base32Chars[(v4 << 3) & 31];
    }
    return base32str;
  }

  static Uint8List _hexDecode(final String input) => Uint8List.fromList([
        for (int i = 0; i < input.length; i += 2) int.parse(input.substring(i, i + 2), radix: 16),
      ]);

  static String _hexEncode(final Uint8List input) => [for (int i = 0; i < input.length; i++) input[i].toRadixString(16).padLeft(2, '0')].join();

  /// Takes in a [hex] string, converts the string to a byte list
  /// and runs a normal encode() on it. Returning a [String] representation
  /// of the base32.
  static String encodeHexString(String b32hex) {
    return encode(_hexDecode(b32hex));
  }

  /// Takes in a [utf8string], converts the string to a byte list
  /// and runs a normal encode() on it. Returning a [String] representation
  /// of the base32.
  static String encodeString(String utf8string) {
    return encode(Uint8List.fromList(utf8string.codeUnits));
  }

  /// Takes in a [base32] string and decodes it back to a [String] in hex format.
  static String decodeAsHexString(String base32) {
    return _hexEncode(decode(base32));
  }

  /// Takes in a [base32] string and decodes it back to a [String].
  static String decodeAsString(String base32) {
    return decode(base32).toList().map((charCode) => String.fromCharCode(charCode)).join();
  }

  /// Takes in a [base32] string and decodes it back to a [Uint8List] that can be
  /// converted to a hex string using hexEncode
  static Uint8List decode(String base32) {
    base32 = base32.toLowerCase();
    if (base32.isEmpty) {
      return Uint8List(0);
    }
    if (!_isValid(base32)) {
      throw FormatException('Invalid Base32 characters');
      //return Uint8List(8);
    }
    var length = base32.indexOf('=');
    if (length == -1) {
      length = base32.length;
    }
    var i = 0;
    var count = length >> 3 << 3;
    var bytes = <int>[];
    while (i < count) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      var v5 = _base32Decode[base32[i++]] ?? 0;
      var v6 = _base32Decode[base32[i++]] ?? 0;
      var v7 = _base32Decode[base32[i++]] ?? 0;
      var v8 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
      bytes.add((v4 << 4 | v5 >> 1) & 255);
      bytes.add((v5 << 7 | v6 << 2 | v7 >> 3) & 255);
      bytes.add((v7 << 5 | v8) & 255);
    }

    var remain = length - count;
    if (remain == 2) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
    } else if (remain == 4) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
    } else if (remain == 5) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      var v5 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
      bytes.add((v4 << 4 | v5 >> 1) & 255);
    } else if (remain == 7) {
      var v1 = _base32Decode[base32[i++]] ?? 0;
      var v2 = _base32Decode[base32[i++]] ?? 0;
      var v3 = _base32Decode[base32[i++]] ?? 0;
      var v4 = _base32Decode[base32[i++]] ?? 0;
      var v5 = _base32Decode[base32[i++]] ?? 0;
      var v6 = _base32Decode[base32[i++]] ?? 0;
      var v7 = _base32Decode[base32[i++]] ?? 0;
      bytes.add((v1 << 3 | v2 >> 2) & 255);
      bytes.add((v2 << 6 | v3 << 1 | v4 >> 4) & 255);
      bytes.add((v4 << 4 | v5 >> 1) & 255);
      bytes.add((v5 << 7 | v6 << 2 | v7 >> 3) & 255);
    }
    return Uint8List.fromList(bytes);
  }

  static bool _isValid(String b32str) {
    if (!_base32Regex.hasMatch(b32str)) {
      return false;
    }
    return true;
  }

  static final _base32Regex = RegExp(r'^[A-Z2-7=]+$');
  static const _base32Chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
  static const _base32Decode = {
    'A': 0,
    'B': 1,
    'C': 2,
    'D': 3,
    'E': 4,
    'F': 5,
    'G': 6,
    'H': 7,
    'I': 8,
    'J': 9,
    'K': 10,
    'L': 11,
    'M': 12,
    'N': 13,
    'O': 14,
    'P': 15,
    'Q': 16,
    'R': 17,
    'S': 18,
    'T': 19,
    'U': 20,
    'V': 21,
    'W': 22,
    'X': 23,
    'Y': 24,
    'Z': 25,
    '2': 26,
    '3': 27,
    '4': 28,
    '5': 29,
    '6': 30,
    '7': 31
  };
}
