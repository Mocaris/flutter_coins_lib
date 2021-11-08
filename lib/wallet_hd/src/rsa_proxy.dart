import 'package:crypton/crypton.dart';
class RsaProxy {
  String get privateKey => _rsaPrivateKey.toString();
  String get publicKey => _rsaPublicKey.toString();

  RSAPrivateKey? _rsaPrivateKey;
  RSAPublicKey? _rsaPublicKey;

  RsaProxy(String? privateKeyString,String? publicKeyString) {
    if (privateKeyString != null) {
      _rsaPrivateKey = RSAPrivateKey.fromString(privateKeyString);
    }
    if (publicKeyString != null) {
      _rsaPublicKey = RSAPublicKey.fromString(publicKeyString);
    }
  }

  Future<bool> verifySignature(String message, String signedText) async {
    try {
      var verified = _rsaPublicKey!.verifySignature(message, signedText);
      return verified;
    } catch (e) {
      print('rsa verifySignature error : $e');
    }
    return false;
  }

  Future<String?> sign(String message) async {
    try {
      var signature = _rsaPrivateKey!.createSignature(message);
      return signature;
    } catch (e) {
      print('rsa sign error : $e');
    }
    return null;
  }

  static Future<RsaProxy> create() async {
    var rsaKeypair = RSAKeypair.fromRandom();
    var rsa = RsaProxy(null, null);
    rsa._rsaPublicKey = rsaKeypair.publicKey;
    rsa._rsaPrivateKey = rsaKeypair.privateKey;
    return rsa;
  }
}
