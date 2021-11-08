import 'package:bip39/bip39.dart' as bip39;

class MnemonicUtil {
  static String toWordsString(List<String> words) {
    return words.join(r' ');
  }

  static List<String> toWordsList(String words) {
    return words.split(r' ');
  }

  bool validMnemonic(String words) {
    return bip39.validateMnemonic(words);
  }

  static List<String> generateMnemonicWordList() {
    var mnemonic = generateMnemonicWord();
    return toWordsList(mnemonic);
  }

  static String generateMnemonicWord() {
    return bip39.generateMnemonic();
  }

  static bool validateMnemonic(String mnemonic) {
    return bip39.validateMnemonic(mnemonic);
  }
}
