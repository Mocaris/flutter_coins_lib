import 'package:flutter_coins_lib/coins_lib.dart';

const mnemonic = 'prevent pact movie provide lens guess answer awful hawk doll dwarf ocean';
// const mnemonic = 'plug antenna grow dose open describe undo price collect eyebrow diamond trophy diesel trust chronic';
// const mnemonic = 'cancel dismiss agree pause account stomach hint shift defense pet power luxury';

void main() async {
  //btc 58124756130572926070397596175292971100636076180169048308114111080809864155646
  //eth 36182365317053231666468130905927227934001993442178206677132718380651370634030
  //fil 34567626804323061873035351843725600787438702693063454719638456802824355742217
  //trx 89188884271671666426468564249980464180029654162241464045801532638825659488138
  var wallet = BtcWallet(mnemonic,mainNet: true);
  // var wallet = EthWallet(mnemonic);
  // var wallet = FilWallet(mnemonic);
  // var wallet = TrxWallet(mnemonic);

  // var privateKey = wallet.privateKey;

  var address=await wallet.generateAddress();

  print(address);

}
