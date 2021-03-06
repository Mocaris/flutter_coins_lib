/*
class Coin {
  final constant;
  final coinSymbol;
  final coinName;

  Coin(this.constant, this.coinSymbol, this.coinName);

  String toString() =>
      'coin name: ${this.coinName}; coin symbol: ${this.coinSymbol}; coin constant: 0x${this.constant.toRadixString(
          16)};';

  List<Coin> constants = [
    Coin(0x80000000, 'BTC', 'Bitcoin'),
    Coin(0x80000001, '', 'Testnet (all coins)'),
    Coin(0x80000002, 'LTC', 'Litecoin'),
    Coin(0x80000003, 'DOGE', 'Dogecoin'),
    Coin(0x80000004, 'RDD', 'Reddcoin'),
    Coin(0x80000005, 'DASH', 'Dash (ex Darkcoin)'),
    Coin(0x80000006, 'PPC', 'Peercoin'),
    Coin(0x80000007, 'NMC', 'Namecoin'),
    Coin(0x80000008, 'FTC', 'Feathercoin'),
    Coin(0x80000009, 'XCP', 'Counterparty'),
    Coin(0x8000000a, 'BLK', 'Blackcoin'),
    Coin(0x8000000b, 'NSR', 'NuShares'),
    Coin(0x8000000c, 'NBT', 'NuBits'),
    Coin(0x8000000d, 'MZC', 'Mazacoin'),
    Coin(0x8000000e, 'VIA', 'Viacoin'),
    Coin(0x8000000f, 'XCH', 'ClearingHouse'),
    Coin(0x80000010, 'RBY', 'Rubycoin'),
    Coin(0x80000011, 'GRS', 'Groestlcoin'),
    Coin(0x80000012, 'DGC', 'Digitalcoin'),
    Coin(0x80000013, 'CCN', 'Cannacoin'),
    Coin(0x80000014, 'DGB', 'DigiByte'),
    Coin(0x80000015, '', 'Open Assets'),
    Coin(0x80000016, 'MONA', 'Monacoin'),
    Coin(0x80000017, 'CLAM', 'Clams'),
    Coin(0x80000018, 'XPM', 'Primecoin'),
    Coin(0x80000019, 'NEOS', 'Neoscoin'),
    Coin(0x8000001a, 'JBS', 'Jumbucks'),
    Coin(0x8000001b, 'ZRC', 'ziftrCOIN'),
    Coin(0x8000001c, 'VTC', 'Vertcoin'),
    Coin(0x8000001d, 'NXT', 'NXT'),
    Coin(0x8000001e, 'BURST', 'Burst'),
    Coin(0x8000001f, 'MUE', 'MonetaryUnit'),
    Coin(0x80000020, 'ZOOM', 'Zoom'),
    Coin(0x80000021, 'VASH', 'Virtual Cash Also known as VPNcoin'),
    Coin(0x80000022, 'CDN', 'Canada eCoin'),
    Coin(0x80000023, 'SDC', 'ShadowCash'),
    Coin(0x80000024, 'PKB', 'ParkByte'),
    Coin(0x80000025, 'PND', 'Pandacoin'),
    Coin(0x80000026, 'START', 'StartCOIN'),
    Coin(0x80000027, 'MOIN', 'MOIN'),
    Coin(0x80000028, 'EXP', 'Expanse'),
    Coin(0x80000029, 'EMC2', 'Einsteinium'),
    Coin(0x8000002a, 'DCR', 'Decred'),
    Coin(0x8000002b, 'XEM', 'NEM'),
    Coin(0x8000002c, 'PART', 'Particl'),
    Coin(0x8000002d, 'ARG', 'Argentum'),
    Coin(0x8000002e, '', 'Libertas'),
    Coin(0x8000002f, '', 'Posw coin'),
    Coin(0x80000030, 'SHR', 'Shreeji'),
    Coin(0x80000031, 'GCR', 'Global Currency Reserve (GCRcoin)'),
    Coin(0x80000032, 'NVC', 'Novacoin'),
    Coin(0x80000033, 'AC', 'Asiacoin'),
    Coin(0x80000034, 'BTCD', 'BitcoinDark'),
    Coin(0x80000035, 'DOPE', 'Dopecoin'),
    Coin(0x80000036, 'TPC', 'Templecoin'),
    Coin(0x80000037, 'AIB', 'AIB'),
    Coin(0x80000038, 'EDRC', 'EDRCoin'),
    Coin(0x80000039, 'SYS', 'Syscoin'),
    Coin(0x8000003a, 'SLR', 'Solarcoin'),
    Coin(0x8000003b, 'SMLY', 'Smileycoin'),
    Coin(0x8000003c, 'ETH', 'Ether'),
    Coin(0x8000003d, 'ETC', 'Ether Classic'),
    Coin(0x8000003e, 'PSB', 'Pesobit'),
    Coin(0x8000003f, 'LDCN', 'Landcoin'),
    Coin(0x80000040, '', 'Open Chain'),
    Coin(0x80000041, 'XBC', 'Bitcoinplus'),
    Coin(0x80000042, 'IOP', 'Internet of People'),
    Coin(0x80000043, 'NXS', 'Nexus'),
    Coin(0x80000044, 'INSN', 'InsaneCoin'),
    Coin(0x80000045, 'OK', 'OKCash'),
    Coin(0x80000046, 'BRIT', 'BritCoin'),
    Coin(0x80000047, 'CMP', 'Compcoin'),
    Coin(0x80000048, 'CRW', 'Crown'),
    Coin(0x80000049, 'BELA', 'BelaCoin'),
    Coin(0x8000004a, 'ICX', 'ICON'),
    Coin(0x8000004b, 'FJC', 'FujiCoin'),
    Coin(0x8000004c, 'MIX', 'MIX'),
    Coin(0x8000004d, 'XVG', 'Verge'),
    Coin(0x8000004e, 'EFL', 'Electronic Gulden'),
    Coin(0x8000004f, 'CLUB', 'ClubCoin'),
    Coin(0x80000050, 'RICHX', 'RichCoin'),
    Coin(0x80000051, 'POT', 'Potcoin'),
    Coin(0x80000052, 'QRK', 'Quarkcoin'),
    Coin(0x80000053, 'TRC', 'Terracoin'),
    Coin(0x80000054, 'GRC', 'Gridcoin'),
    Coin(0x80000055, 'AUR', 'Auroracoin'),
    Coin(0x80000056, 'IXC', 'IXCoin'),
    Coin(0x80000057, 'NLG', 'Gulden'),
    Coin(0x80000058, 'BITB', 'BitBean'),
    Coin(0x80000059, 'BTA', 'Bata'),
    Coin(0x8000005a, 'XMY', 'Myriadcoin'),
    Coin(0x8000005b, 'BSD', 'BitSend'),
    Coin(0x8000005c, 'UNO', 'Unobtanium'),
    Coin(0x8000005d, 'MTR', 'MasterTrader'),
    Coin(0x8000005e, 'GB', 'GoldBlocks'),
    Coin(0x8000005f, 'SHM', 'Saham'),
    Coin(0x80000060, 'CRX', 'Chronos'),
    Coin(0x80000061, 'BIQ', 'Ubiquoin'),
    Coin(0x80000062, 'EVO', 'Evotion'),
    Coin(0x80000063, 'STO', 'SaveTheOcean'),
    Coin(0x80000064, 'BIGUP', 'BigUp'),
    Coin(0x80000065, 'GAME', 'GameCredits'),
    Coin(0x80000066, 'DLC', 'Dollarcoins'),
    Coin(0x80000067, 'ZYD', 'Zayedcoin'),
    Coin(0x80000068, 'DBIC', 'Dubaicoin'),
    Coin(0x80000069, 'STRAT', 'Stratis'),
    Coin(0x8000006a, 'SH', 'Shilling'),
    Coin(0x8000006b, 'MARS', 'MarsCoin'),
    Coin(0x8000006c, 'UBQ', 'Ubiq'),
    Coin(0x8000006d, 'PTC', 'Pesetacoin'),
    Coin(0x8000006e, 'NRO', 'Neurocoin'),
    Coin(0x8000006f, 'ARK', 'ARK'),
    Coin(0x80000070, 'USC', 'UltimateSecureCashMain'),
    Coin(0x80000071, 'THC', 'Hempcoin'),
    Coin(0x80000072, 'LINX', 'Linx'),
    Coin(0x80000073, 'ECN', 'Ecoin'),
    Coin(0x80000074, 'DNR', 'Denarius'),
    Coin(0x80000075, 'PINK', 'Pinkcoin'),
    Coin(0x80000076, 'ATOM', 'Atom'),
    Coin(0x80000077, 'PIVX', 'Pivx'),
    Coin(0x80000078, 'FLASH', 'Flashcoin'),
    Coin(0x80000079, 'ZEN', 'Zencash'),
    Coin(0x8000007a, 'PUT', 'Putincoin'),
    Coin(0x8000007b, 'ZNY', 'BitZeny'),
    Coin(0x8000007c, 'UNIFY', 'Unify'),
    Coin(0x8000007d, 'XST', 'StealthCoin'),
    Coin(0x8000007e, 'BRK', 'Breakout Coin'),
    Coin(0x8000007f, 'VC', 'Vcash'),
    Coin(0x80000080, 'XMR', 'Monero'),
    Coin(0x80000081, 'VOX', 'Voxels'),
    Coin(0x80000082, 'NAV', 'NavCoin'),
    Coin(0x80000083, 'FCT', 'Factom Factoids'),
    Coin(0x80000084, 'EC', 'Factom Entry Credits'),
    Coin(0x80000085, 'ZEC', 'Zcash'),
    Coin(0x80000086, 'LSK', 'Lisk'),
    Coin(0x80000087, 'STEEM', 'Steem'),
    Coin(0x80000088, 'XZC', 'ZCoin'),
    Coin(0x80000089, 'RBTC', 'RSK'),
    Coin(0x8000008a, '', 'Giftblock'),
    Coin(0x8000008b, 'RPT', 'RealPointCoin'),
    Coin(0x8000008c, 'LBC', 'LBRY Credits'),
    Coin(0x8000008d, 'KMD', 'Komodo'),
    Coin(0x8000008e, 'BSQ', 'bisq Token'),
    Coin(0x8000008f, 'RIC', 'Riecoin'),
    Coin(0x80000090, 'XRP', 'Ripple'),
    Coin(0x80000091, 'BCH', 'Bitcoin Cash'),
    Coin(0x80000092, 'NEBL', 'Neblio'),
    Coin(0x80000093, 'ZCL', 'ZClassic'),
    Coin(0x80000094, 'XLM', 'Stellar Lumens'),
    Coin(0x80000095, 'NLC2', 'NoLimitCoin2'),
    Coin(0x80000096, 'WHL', 'WhaleCoin'),
    Coin(0x80000097, 'ERC', 'EuropeCoin'),
    Coin(0x80000098, 'DMD', 'Diamond'),
    Coin(0x80000099, 'BTM', 'Bytom'),
    Coin(0x8000009a, 'BIO', 'Biocoin'),
    Coin(0x8000009b, 'XWCC', 'Whitecoin Classic'),
    Coin(0x8000009c, 'BTG', 'Bitcoin Gold'),
    Coin(0x8000009d, 'BTC2X', 'Bitcoin 2x'),
    Coin(0x8000009e, 'SSN', 'SuperSkynet'),
    Coin(0x8000009f, 'TOA', 'TOACoin'),
    Coin(0x800000a0, 'BTX', 'Bitcore'),
    Coin(0x800000a1, 'ACC', 'Adcoin'),
    Coin(0x800000a2, 'BCO', 'Bridgecoin'),
    Coin(0x800000a3, 'ELLA', 'Ellaism'),
    Coin(0x800000a4, 'PIRL', 'Pirl'),
    Coin(0x800000a5, 'NANO', 'Nano'),
    Coin(0x800000a6, 'VIVO', 'Vivo'),
    Coin(0x800000a7, 'FRST', 'Firstcoin'),
    Coin(0x800000a8, 'HNC', 'Helleniccoin'),
    Coin(0x800000a9, 'BUZZ', 'BUZZ'),
    Coin(0x800000aa, 'MBRS', 'Ember'),
    Coin(0x800000ab, 'HC', 'Hcash'),
    Coin(0x800000ac, 'HTML', 'HTMLCOIN'),
    Coin(0x800000ad, 'ODN', 'Obsidian'),
    Coin(0x800000ae, 'ONX', 'OnixCoin'),
    Coin(0x800000af, 'RVN', 'Ravencoin'),
    Coin(0x800000b0, 'GBX', 'GoByte'),
    Coin(0x800000b1, 'BTCZ', 'BitcoinZ'),
    Coin(0x800000b2, 'POA', 'Poa'),
    Coin(0x800000b3, 'NYC', 'NewYorkCoin'),
    Coin(0x800000b4, 'MXT', 'MarteXcoin'),
    Coin(0x800000b5, 'WC', 'Wincoin'),
    Coin(0x800000b6, 'MNX', 'Minexcoin'),
    Coin(0x800000b7, 'BTCP', 'Bitcoin Private'),
    Coin(0x800000b8, 'MUSIC', 'Musicoin'),
    Coin(0x800000b9, 'BCA', 'Bitcoin Atom'),
    Coin(0x800000ba, 'CRAVE', 'Crave'),
    Coin(0x800000bb, 'STAK', 'STRAKS'),
    Coin(0x800000bc, 'WBTC', 'World Bitcoin'),
    Coin(0x800000bd, 'LCH', 'LiteCash'),
    Coin(0x800000be, 'EXCL', 'ExclusiveCoin'),
    Coin(0x800000bf, '', 'Lynx'),
    Coin(0x800000c0, 'LCC', 'LitecoinCash'),
    Coin(0x800000c1, 'XFE', 'Feirm'),
    Coin(0x800000c2, 'EOS', 'EOS'),
    Coin(0x800000c3, 'TRX', 'Tron'),
    Coin(0x800000c4, 'KOBO', 'Kobocoin'),
    Coin(0x800000c5, 'HUSH', 'HUSH'),
    Coin(0x800000c6, 'BANANO', 'Bananos'),
    Coin(0x800000c7, 'ETF', 'ETF'),
    Coin(0x800000c8, 'OMNI', 'Omni'),
    Coin(0x800000c9, 'BIFI', 'BitcoinFile'),
    Coin(0x800000ca, 'UFO', 'Uniform Fiscal Object'),
    Coin(0x800000cb, 'CNMC', 'Cryptonodes'),
    Coin(0x800000cc, 'BCN', 'Bytecoin'),
    Coin(0x800000cd, 'RIN', 'Ringo'),
    Coin(0x800000ce, 'ATP', 'PlatON'),
    Coin(0x800000cf, 'EVT', 'everiToken'),
    Coin(0x800000d0, 'ATN', 'ATN'),
    Coin(0x800000d1, 'BIS', 'Bismuth'),
    Coin(0x800000d2, 'NEET', 'NEETCOIN'),
    Coin(0x800000d3, 'BOPO', 'BopoChain'),
    Coin(0x800000d4, 'OOT', 'Utrum'),
    Coin(0x800000d5, 'ALIAS', 'Alias'),
    Coin(0x800000d6, 'MONK', 'Monkey Project'),
    Coin(0x800000d7, 'BOXY', 'BoxyCoin'),
    Coin(0x800000d8, 'FLO', 'Flo'),
    Coin(0x800000d9, 'MEC', 'Megacoin'),
    Coin(0x800000da, 'BTDX', 'BitCloud'),
    Coin(0x800000db, 'XAX', 'Artax'),
    Coin(0x800000dc, 'ANON', 'ANON'),
    Coin(0x800000dd, 'LTZ', 'LitecoinZ'),
    Coin(0x800000de, 'BITG', 'Bitcoin Green'),
    Coin(0x800000df, 'ASK', 'AskCoin'),
    Coin(0x800000e0, 'SMART', 'Smartcash'),
    Coin(0x800000e1, 'XUEZ', 'XUEZ'),
    Coin(0x800000e2, 'HLM', 'Helium'),
    Coin(0x800000e3, 'WEB', 'Webchain'),
    Coin(0x800000e4, 'ACM', 'Actinium'),
    Coin(0x800000e5, 'NOS', 'NOS Stable Coins'),
    Coin(0x800000e6, 'BITC', 'BitCash'),
    Coin(0x800000e7, 'HTH', 'Help The Homeless Coin'),
    Coin(0x800000e8, 'TZC', 'Trezarcoin'),
    Coin(0x800000e9, 'VAR', 'Varda'),
    Coin(0x800000ea, 'IOV', 'IOV'),
    Coin(0x800000eb, 'FIO', 'FIO'),
    Coin(0x800000ec, 'BSV', 'BitcoinSV'),
    Coin(0x800000ed, 'DXN', 'DEXON'),
    Coin(0x800000ee, 'QRL', 'Quantum Resistant Ledger'),
    Coin(0x800000ef, 'PCX', 'ChainX'),
    Coin(0x800000f0, 'LOKI', 'Loki'),
    Coin(0x800000f1, '', 'Imagewallet'),
    Coin(0x800000f2, 'NIM', 'Nimiq'),
    Coin(0x800000f3, 'SOV', 'Sovereign Coin'),
    Coin(0x800000f4, 'JCT', 'Jibital Coin'),
    Coin(0x800000f5, 'SLP', 'Simple Ledger Protocol'),
    Coin(0x800000f6, 'EWT', 'Energy Web'),
    Coin(0x800000f7, 'UC', 'Ulord'),
    Coin(0x800000f8, 'EXOS', 'EXOS'),
    Coin(0x800000f9, 'ECA', 'Electra'),
    Coin(0x800000fa, 'SOOM', 'Soom'),
    Coin(0x800000fb, 'XRD', 'Redstone'),
    Coin(0x800000fc, 'FREE', 'FreeCoin'),
    Coin(0x800000fd, 'NPW', 'NewPowerCoin'),
    Coin(0x800000fe, 'BST', 'BlockStamp'),
    Coin(0x800000ff, '', 'SmartHoldem'),
    Coin(0x80000100, 'NANO', 'Bitcoin Nano'),
    Coin(0x80000101, 'BTCC', 'Bitcoin Core'),
    Coin(0x80000102, '', 'Zen Protocol'),
    Coin(0x80000103, 'ZEST', 'Zest'),
    Coin(0x80000104, 'ABT', 'ArcBlock'),
    Coin(0x80000105, 'PION', 'Pion'),
    Coin(0x80000106, 'DT3', 'DreamTeam3'),
    Coin(0x80000107, 'ZBUX', 'Zbux'),
    Coin(0x80000108, 'KPL', 'Kepler'),
    Coin(0x80000109, 'TPAY', 'TokenPay'),
    Coin(0x8000010a, 'ZILLA', 'ChainZilla'),
    Coin(0x8000010b, 'ANK', 'Anker'),
    Coin(0x8000010c, 'BCC', 'BCChain'),
    Coin(0x8000010d, 'HPB', 'HPB'),
    Coin(0x8000010e, 'ONE', 'ONE'),
    Coin(0x8000010f, 'SBC', 'SBC'),
    Coin(0x80000110, 'IPC', 'IPChain'),
    Coin(0x80000111, 'DMTC', 'Dominantchain'),
    Coin(0x80000112, 'OGC', 'Onegram'),
    Coin(0x80000113, 'SHIT', 'Shitcoin'),
    Coin(0x80000114, 'ANDES', 'Andescoin'),
    Coin(0x80000115, 'AREPA', 'Arepacoin'),
    Coin(0x80000116, 'BOLI', 'Bolivarcoin'),
    Coin(0x80000117, 'RIL', 'Rilcoin'),
    Coin(0x80000118, 'HTR', 'Hathor Network'),
    Coin(0x80000119, 'FCTID', 'Factom ID'),
    Coin(0x8000011a, 'BRAVO', 'BRAVO'),
    Coin(0x8000011b, 'ALGO', 'Algorand'),
    Coin(0x8000011c, 'BZX', 'Bitcoinzero'),
    Coin(0x8000011d, 'GXX', 'GravityCoin'),
    Coin(0x8000011e, 'HEAT', 'HEAT'),
    Coin(0x8000011f, 'XDN', 'DigitalNote'),
    Coin(0x80000120, 'FSN', 'FUSION'),
    Coin(0x80000121, 'CPC', 'Capricoin'),
    Coin(0x80000122, 'BOLD', 'Bold'),
    Coin(0x80000123, 'IOST', 'IOST'),
    Coin(0x80000124, 'TKEY', 'Tkeycoin'),
    Coin(0x80000125, 'USE', 'Usechain'),
    Coin(0x80000126, 'BCZ', 'BitcoinCZ'),
    Coin(0x80000127, 'IOC', 'Iocoin'),
    Coin(0x80000128, 'ASF', 'Asofe'),
    Coin(0x80000129, 'MASS', 'MASS'),
    Coin(0x8000012a, 'FAIR', 'FairCoin'),
    Coin(0x8000012b, 'NUKO', 'Nekonium'),
    Coin(0x8000012c, 'GNX', 'Genaro Network'),
    Coin(0x8000012d, 'DIVI', 'Divi Project'),
    Coin(0x8000012e, 'CMT', 'Community'),
    Coin(0x8000012f, 'EUNO', 'EUNO'),
    Coin(0x80000130, 'IOTX', 'IoTeX'),
    Coin(0x80000131, 'ONION', 'DeepOnion'),
    Coin(0x80000132, '8BIT', '8Bit'),
    Coin(0x80000133, 'ATC', 'AToken Coin'),
    Coin(0x80000134, 'BTS', 'Bitshares'),
    Coin(0x80000135, 'CKB', 'Nervos CKB'),
    Coin(0x80000136, 'UGAS', 'Ultrain'),
    Coin(0x80000137, 'ADS', 'Adshares'),
    Coin(0x80000138, 'ARA', 'Aura'),
    Coin(0x80000139, 'ZIL', 'Zilliqa'),
    Coin(0x8000013a, 'MOAC', 'MOAC'),
    Coin(0x8000013b, 'SWTC', 'SWTC'),
    Coin(0x8000013c, 'VNSC', 'vnscoin'),
    Coin(0x8000013d, 'PLUG', 'Pl^g'),
    Coin(0x8000013e, 'MAN', 'Matrix AI Network'),
    Coin(0x8000013f, 'ECC', 'ECCoin'),
    Coin(0x80000140, 'RPD', 'Rapids'),
    Coin(0x80000141, 'RAP', 'Rapture'),
    Coin(0x80000142, 'GARD', 'Hashgard'),
    Coin(0x80000143, 'ZER', 'Zero'),
    Coin(0x80000144, 'EBST', 'eBoost'),
    Coin(0x80000145, 'SHARD', 'Shard'),
    Coin(0x80000146, 'LINDA', 'Linda Coin'),
    Coin(0x80000147, 'CMM', 'Commercium'),
    Coin(0x80000148, 'BLOCK', 'Blocknet'),
    Coin(0x80000149, 'AUDAX', 'AUDAX'),
    Coin(0x8000014a, 'LUNA', 'Terra'),
    Coin(0x8000014b, 'ZPM', 'zPrime'),
    Coin(0x8000014c, 'KUVA', 'Kuva Utility Note'),
    Coin(0x8000014d, 'MEM', 'MemCoin'),
    Coin(0x8000014e, 'CS', 'Credits'),
    Coin(0x8000014f, 'SWIFT', 'SwiftCash'),
    Coin(0x80000150, 'FIX', 'FIX'),
    Coin(0x80000151, 'CPC', 'CPChain'),
    Coin(0x80000152, 'VGO', 'VirtualGoodsToken'),
    Coin(0x80000153, 'DVT', 'DeVault'),
    Coin(0x80000154, 'N8V', 'N8VCoin'),
    Coin(0x80000155, 'MTNS', 'OmotenashiCoin'),
    Coin(0x80000156, 'BLAST', 'BLAST'),
    Coin(0x80000157, 'DCT', 'DECENT'),
    Coin(0x80000158, 'AUX', 'Auxilium'),
    Coin(0x80000159, 'USDP', 'USDP'),
    Coin(0x8000015a, 'HTDF', 'HTDF'),
    Coin(0x8000015b, 'YEC', 'Ycash'),
    Coin(0x8000015c, 'QLC', 'QLC Chain'),
    Coin(0x8000015d, 'TEA', 'Icetea Blockchain'),
    Coin(0x8000015e, 'ARW', 'ArrowChain'),
    Coin(0x8000015f, 'MDM', 'Medium'),
    Coin(0x80000160, 'CYB', 'Cybex'),
    Coin(0x80000161, 'LTO', 'LTO Network'),
    Coin(0x80000162, 'DOT', 'Polkadot'),
    Coin(0x80000163, 'AEON', 'Aeon'),
    Coin(0x80000164, 'RES', 'Resistance'),
    Coin(0x80000165, 'AYA', 'Aryacoin'),
    Coin(0x80000166, 'DAPS', 'Dapscoin'),
    Coin(0x80000167, 'CSC', 'CasinoCoin'),
    Coin(0x80000168, 'VSYS', 'V Systems'),
    Coin(0x80000169, 'NOLLAR', 'Nollar'),
    Coin(0x8000016a, 'XNOS', 'NOS'),
    Coin(0x8000016b, 'CPU', 'CPUchain'),
    Coin(0x8000016c, 'LAMB', 'Lambda Storage Chain'),
    Coin(0x8000016d, 'VCT', 'ValueCyber'),
    Coin(0x8000016e, 'CZR', 'Canonchain'),
    Coin(0x8000016f, 'ABBC', 'ABBC'),
    Coin(0x80000170, 'HET', 'HET'),
    Coin(0x80000171, 'XAS', 'Asch'),
    Coin(0x80000172, 'VDL', 'Vidulum'),
    Coin(0x80000173, 'MED', 'MediBloc'),
    Coin(0x80000174, 'ZVC', 'ZVChain'),
    Coin(0x80000175, 'VESTX', 'Vestx'),
    Coin(0x80000176, 'DBT', 'DarkBit'),
    Coin(0x80000177, 'SEOS', 'SuperEOS'),
    Coin(0x80000178, 'MXW', 'Maxonrow'),
    Coin(0x80000179, 'ZNZ', 'ZENZO'),
    Coin(0x8000017a, 'XCX', 'XChain'),
    Coin(0x8000017b, 'SOX', 'SonicX'),
    Coin(0x8000017c, 'NYZO', 'Nyzo'),
    Coin(0x8000017d, 'ULC', 'ULCoin'),
    Coin(0x8000017e, 'RYO', 'Ryo Currency'),
    Coin(0x8000017f, 'KAL', 'Kaleidochain'),
    Coin(0x80000180, 'XSN', 'Stakenet'),
    Coin(0x80000181, 'DOGEC', 'DogeCash'),
    Coin(0x80000182, 'BMV', 'Bitcoin Matteo\'s Vision'),
    Coin(0x80000183, 'QBC', 'Quebecoin'),
    Coin(0x80000184, 'IMG', 'ImageCoin'),
    Coin(0x80000185, 'QOS', 'QOS'),
    Coin(0x80000186, 'PKT', 'PKT'),
    Coin(0x80000187, 'LHD', 'LitecoinHD'),
    Coin(0x80000188, 'CENNZ', 'CENNZnet'),
    Coin(0x80000189, 'HSN', 'Hyper Speed Network'),
    Coin(0x8000018a, 'CRO', 'Crypto.com Chain'),
    Coin(0x8000018b, 'UMBRU', 'Umbru'),
    Coin(0x8000018c, 'TON', 'Free TON'),
    Coin(0x8000018d, 'NEAR', 'NEAR Protocol'),
    Coin(0x8000018e, 'XPC', 'XPChain'),
    Coin(0x8000018f, 'ZOC', '01coin'),
    Coin(0x80000190, 'NIX', 'NIX'),
    Coin(0x80000191, 'UC', 'Utopiacoin'),
    Coin(0x80000192, 'GALI', 'Galilel'),
    Coin(0x80000193, 'OLT', 'Oneledger'),
    Coin(0x80000194, 'XBI', 'XBI'),
    Coin(0x80000195, 'DONU', 'DONU'),
    Coin(0x80000196, 'EARTHS', 'Earths'),
    Coin(0x80000197, 'HDD', 'HDDCash'),
    Coin(0x80000198, 'SUGAR', 'Sugarchain'),
    Coin(0x80000199, 'AILE', 'AileCoin'),
    Coin(0x8000019a, 'XSG', 'SnowGem'),
    Coin(0x8000019b, 'TAN', 'Tangerine Network'),
    Coin(0x8000019c, 'AIN', 'AIN'),
    Coin(0x8000019d, 'MSR', 'Masari'),
    Coin(0x8000019e, 'SUMO', 'Sumokoin'),
    Coin(0x8000019f, 'ETN', 'Electroneum'),
    Coin(0x800001a0, 'BYTZ', 'BYTZ'),
    Coin(0x800001a1, 'WOW', 'Wownero'),
    Coin(0x800001a2, 'XTNC', 'XtendCash'),
    Coin(0x800001a3, 'LTHN', 'Lethean'),
    Coin(0x800001a4, 'NODE', 'NodeHost'),
    Coin(0x800001a5, 'AGM', 'Argoneum'),
    Coin(0x800001a6, 'CCX', 'Conceal Network'),
    Coin(0x800001a7, 'TNET', 'Title Network'),
    Coin(0x800001a8, 'TELOS', 'TelosCoin'),
    Coin(0x800001a9, 'AION', 'Aion'),
    Coin(0x800001aa, 'BC', 'Bitcoin Confidential'),
    Coin(0x800001ab, 'KTV', 'KmushiCoin'),
    Coin(0x800001ac, 'ZCR', 'ZCore'),
    Coin(0x800001ad, 'ERG', 'Ergo'),
    Coin(0x800001ae, 'PESO', 'Criptopeso'),
    Coin(0x800001af, 'BTC2', 'Bitcoin 2'),
    Coin(0x800001b0, 'XRPHD', 'XRPHD'),
    Coin(0x800001b1, 'WE', 'WE Coin'),
    Coin(0x800001b2, 'KSM', 'Kusama'),
    Coin(0x800001b3, 'PCN', 'Peepcoin'),
    Coin(0x800001b4, 'NCH', 'NetCloth'),
    Coin(0x800001b5, 'ICU', 'CHIPO'),
    Coin(0x800001b6, 'LN', 'LINK'),
    Coin(0x800001b7, 'DTP', 'DeVault Token Protocol'),
    Coin(0x800001b8, 'BTCR', 'Bitcoin Royale'),
    Coin(0x800001b9, 'AERGO', 'AERGO'),
    Coin(0x800001ba, 'XTH', 'Dothereum'),
    Coin(0x800001bb, 'LV', 'Lava'),
    Coin(0x800001bc, 'PHR', 'Phore'),
    Coin(0x800001bd, 'VITAE', 'Vitae'),
    Coin(0x800001be, 'COCOS', 'Cocos-BCX'),
    Coin(0x800001bf, 'DIN', 'Dinero'),
    Coin(0x800001c0, 'SPL', 'Simplicity'),
    Coin(0x800001c1, 'YCE', 'MYCE'),
    Coin(0x800001c2, 'XLR', 'Solaris'),
    Coin(0x800001c3, 'KTS', 'Klimatas'),
    Coin(0x800001c4, 'DGLD', 'DGLD'),
    Coin(0x800001c5, 'XNS', 'Insolar'),
    Coin(0x800001c6, 'EM', 'EMPOW'),
    Coin(0x800001c7, 'SHN', 'ShineBlocks'),
    Coin(0x800001c8, 'SEELE', 'Seele'),
    Coin(0x800001c9, 'AE', '??ternity'),
    Coin(0x800001ca, 'ODX', 'ObsidianX'),
    Coin(0x800001cb, 'KAVA', 'Kava'),
    Coin(0x800001cc, 'GLEEC', 'GLEEC'),
    Coin(0x800001cd, 'FIL', 'Filecoin'),
    Coin(0x800001ce, 'RUTA', 'Rutanio'),
    Coin(0x800001cf, 'CSDT', 'CSDT'),
    Coin(0x800001d0, 'ETI', 'EtherInc'),
    Coin(0x800001d1, 'ZSLP', 'Zclassic Simple Ledger Protocol'),
    Coin(0x800001d2, 'ERE', 'EtherCore'),
    Coin(0x800001d3, 'DX', 'DxChain Token'),
    Coin(0x800001d4, 'CPS', 'Capricoin+'),
    Coin(0x800001d5, 'BTH', 'Bithereum'),
    Coin(0x800001d6, 'MESG', 'MESG'),
    Coin(0x800001d7, 'FIMK', 'FIMK'),
    Coin(0x800001d8, 'AR', 'Arweave'),
    Coin(0x800001d9, 'OGO', 'Origo'),
    Coin(0x800001da, 'ROSE', 'Oasis Network'),
    Coin(0x800001db, 'BARE', 'BARE Network'),
    Coin(0x800001dc, 'GLEEC', 'GleecBTC'),
    Coin(0x800001dd, 'CLR', 'Color Coin'),
    Coin(0x800001de, 'RNG', 'Ring'),
    Coin(0x800001df, 'OLO', 'Tool Global'),
    Coin(0x800001e0, 'PEXA', 'Pexa'),
    Coin(0x800001e1, 'MOON', 'Mooncoin'),
    Coin(0x800001e2, 'OCEAN', 'Ocean Protocol'),
    Coin(0x800001e3, 'BNT', 'Bluzelle Native'),
    Coin(0x800001e4, 'AMO', 'AMO Blockchain'),
    Coin(0x800001e5, 'FCH', 'FreeCash'),
    Coin(0x800001e6, 'LAT', 'LatticeX'),
    Coin(0x800001e7, 'COIN', 'Bitcoin Bank'),
    Coin(0x800001e8, 'VEO', 'Amoveo'),
    Coin(0x800001e9, 'CCA', 'Counos Coin'),
    Coin(0x800001ea, 'GFN', 'Graphene'),
    Coin(0x800001eb, 'BIP', 'Minter Network'),
    Coin(0x800001ec, 'KPG', 'Kunpeng Network'),
    Coin(0x800001ed, 'FIN', 'FINL Chain'),
    Coin(0x800001ee, 'BAND', 'Band'),
    Coin(0x800001ef, 'DROP', 'Dropil'),
    Coin(0x800001f0, 'BHT', 'Bluehelix Chain'),
    Coin(0x800001f1, 'LYRA', 'Scrypta'),
    Coin(0x800001f2, 'CS', 'Credits'),
    Coin(0x800001f3, 'RUPX', 'Rupaya'),
    Coin(0x800001f4, 'THETA', 'Theta'),
    Coin(0x800001f5, 'SOL', 'Solana'),
    Coin(0x800001f6, 'THT', 'ThoughtAI'),
    Coin(0x800001f7, 'CFX', 'Conflux'),
    Coin(0x800001f8, 'KUMA', 'Kumacoin'),
    Coin(0x800001f9, 'HASH', 'Provenance'),
    Coin(0x800001fa, 'CLX', 'CasperLabs'),
    Coin(0x800001fb, 'EARTH', 'EARTH'),
    Coin(0x800001fc, 'ERD', 'Elrond'),
    Coin(0x800001fd, 'CHI', 'Xaya'),
    Coin(0x800001fe, 'KOTO', 'Koto'),
    Coin(0x800001ff, 'OTC', '??'),
    Coin(0x80000200, 'XRD', 'Radiant'),
    Coin(0x80000201, 'SEELEN', 'Seele-N'),
    Coin(0x80000202, 'AETH', 'AETH'),
    Coin(0x80000203, 'DNA', 'Idena'),
    Coin(0x80000204, 'VEE', 'Virtual Economy Era'),
    Coin(0x80000205, 'SIERRA', 'SierraCoin'),
    Coin(0x80000206, 'LET', 'Linkeye'),
    Coin(0x80000207, 'BSC', 'Bitcoin Smart Contract'),
    Coin(0x80000208, 'BTCV', 'BitcoinVIP'),
    Coin(0x80000209, 'ABA', 'Dabacus'),
    Coin(0x8000020a, 'SCC', 'StakeCubeCoin'),
    Coin(0x8000020b, 'EDG', 'Edgeware'),
    Coin(0x8000020c, 'AMS', 'AmsterdamCoin'),
    Coin(0x8000020d, 'GOSS', 'GOSSIP Coin'),
    Coin(0x8000020e, 'BU', 'BUMO'),
    Coin(0x8000020f, 'GRAM', 'GRAM'),
    Coin(0x80000210, 'YAP', 'Yapstone'),
    Coin(0x80000211, 'SCRT', 'Secret Network'),
    Coin(0x80000212, 'NOVO', 'Novo'),
    Coin(0x80000213, 'GHOST', 'Ghost'),
    Coin(0x80000214, 'HST', 'HST'),
    Coin(0x80000215, 'PRJ', 'ProjectCoin'),
    Coin(0x80000216, 'YOU', 'YOUChain'),
    Coin(0x80000217, 'XHV', 'Haven Protocol'),
    Coin(0x80000218, 'BYND', 'Beyondcoin'),
    Coin(0x80000219, 'JOYS', 'Joys Digital'),
    Coin(0x8000021a, 'VAL', 'Valorbit'),
    Coin(0x8000021b, 'FLOW', 'Flow'),
    Coin(0x8000021c, 'SMESH', 'Spacemesh Coin'),
    Coin(0x8000021d, 'SCDO', 'SCDO'),
    Coin(0x8000021e, 'IQS', 'IQ-Cash'),
    Coin(0x8000021f, 'BIND', 'Compendia'),
    Coin(0x80000220, 'COINEVO', 'Coinevo'),
    Coin(0x80000221, 'SCRIBE', 'Scribe'),
    Coin(0x80000222, 'HYN', 'Hyperion'),
    Coin(0x80000223, 'BHP', 'BHP'),
    Coin(0x80000224, 'BBC', 'BigBang Core'),
    Coin(0x80000225, 'MKF', 'MarketFinance'),
    Coin(0x80000226, 'XDC', 'XinFin.Network'),
    Coin(0x80000227, 'STR', 'Straightedge'),
    Coin(0x80000228, 'SUM', 'Sumcoin'),
    Coin(0x80000229, 'HBC', 'HuobiChain'),
    Coin(0x8000022a, 'FLR', 'Flare Spark'),
    Coin(0x8000022b, 'BCS', 'Bitcoin Smart'),
    Coin(0x8000022c, 'KTS', 'Kratos'),
    Coin(0x8000022d, 'LKR', 'Lkrcoin'),
    Coin(0x8000022e, 'TAO', 'Tao'),
    Coin(0x8000022f, 'XWC', 'Whitecoin'),
    Coin(0x80000230, 'DEAL', 'DEAL'),
    Coin(0x80000231, 'NTY', 'Nexty'),
    Coin(0x80000232, 'TOP', 'TOP NetWork'),
    Coin(0x80000233, 'STARS', 'Stargaze'),
    Coin(0x80000234, 'AG', 'Agoric'),
    Coin(0x80000235, 'CICO', 'Coinicles'),
    Coin(0x80000236, 'IRIS', 'Irisnet'),
    Coin(0x80000237, 'NCG', 'Nine Chronicles'),
    Coin(0x80000238, 'LRG', 'Large Coin'),
    Coin(0x80000239, 'SERO', 'Super Zero Protocol'),
    Coin(0x8000023a, 'BDX', 'Beldex'),
    Coin(0x8000023b, 'CCXX', 'Counos X'),
    Coin(0x8000023c, 'SLS', 'Saluscoin'),
    Coin(0x8000023d, 'SRM', 'Serum'),
    Coin(0x8000023e, 'VLX', 'Velas'),
    Coin(0x8000023f, 'VIVT', 'VIDT Datalink'),
    Coin(0x80000240, 'BPS', 'BitcoinPoS'),
    Coin(0x80000241, 'NKN', 'NKN'),
    Coin(0x80000242, 'ICL', 'ILCOIN'),
    Coin(0x80000243, 'BONO', 'Bonorum'),
    Coin(0x80000244, 'PLC', 'PLATINCOIN'),
    Coin(0x80000245, 'DUN', 'Dune'),
    Coin(0x80000246, 'DMCH', 'Darmacash'),
    Coin(0x80000247, 'CTC', 'Creditcoin'),
    Coin(0x80000248, 'KELP', 'Haidai Network'),
    Coin(0x80000249, 'GBCR', 'GoldBCR'),
    Coin(0x8000024a, 'XDAG', 'XDAG'),
    Coin(0x8000024b, 'PRV', 'Incognito Privacy'),
    Coin(0x8000024c, 'SCAP', 'SafeCapital'),
    Coin(0x8000024d, 'TFUEL', 'Theta Fuel'),
    Coin(0x8000024e, 'GTM', 'Gentarium'),
    Coin(0x8000024f, 'RNL', 'RentalChain'),
    Coin(0x80000250, 'GRIN', 'Grin'),
    Coin(0x80000251, 'MWC', 'MimbleWimbleCoin'),
    Coin(0x80000252, 'DOCK', 'Coin(Dock)Coin(https://dock.io)'),
    Coin(0x80000253, 'POLYX', 'Polymesh'),
    Coin(0x80000254, 'DIVER', 'Divergenti'),
    Coin(0x80000255, 'XEP', 'Electra Protocol'),
    Coin(0x80000256, 'APN', 'Apron'),
    Coin(0x80000257, 'TFC', 'Turbo File Coin'),
    Coin(0x80000258, 'UTE', 'Unit-e'),
    Coin(0x80000262, 'NOR', 'Noir'),
    Coin(0x8000026a, 'SSP', 'SmartShare'),
    Coin(0x80000271, 'EAST', 'Eastcoin'),
    Coin(0x80000280, 'LFC', 'Leofcoin'),
    Coin(0x80000297, 'SFRX', 'EtherGem Sapphire'),
    Coin(0x8000029a, 'ACT', 'Achain'),
    Coin(0x8000029b, 'PRKL', 'Perkle'),
    Coin(0x8000029c, 'SSC', 'SelfSell'),
    Coin(0x8000029d, 'GC', 'GateChain'),
    Coin(0x800002a6, 'Voken', 'Voken'),
    Coin(0x800002ae, 'KAR', 'Karura Network'),
    Coin(0x800002b0, 'CET', 'CoinEx Chain'),
    Coin(0x800002ba, 'VEIL', 'Veil'),
    Coin(0x800002bc, 'XDAI', 'xDai'),
    Coin(0x800002c7, 'CHC', 'Chaincoin'),
    Coin(0x800002c9, 'XTL', 'Katal Chain'),
    Coin(0x800002ca, 'BNB', 'Binance'),
    Coin(0x800002cb, 'SIN', 'Sinovate'),
    Coin(0x80000300, 'BALLZ', 'Ballzcoin'),
    Coin(0x80000303, 'BR', 'BR'),
    Coin(0x80000309, 'BTW', 'Bitcoin World'),
    Coin(0x80000313, 'ACA', 'Acala'),
    Coin(0x80000320, 'BEET', 'Beetle Coin'),
    Coin(0x80000321, 'DST', 'DSTRA'),
    Coin(0x80000328, 'QVT', 'Qvolta'),
    Coin(0x80000332, 'VET', 'VeChain Token'),
    Coin(0x80000334, 'CLO', 'Callisto'),
    Coin(0x8000033f, 'CRUZ', 'cruzbit'),
    Coin(0x80000354, 'DSM', 'Desmos'),
    Coin(0x80000355, 'PRCY', 'PRCY Coin'),
    Coin(0x80000364, 'IF', 'Infinitefuture'),
    Coin(0x80000373, 'ZBC', 'ZooBC'),
    Coin(0x80000376, 'ADF', 'AD Token'),
    Coin(0x80000378, 'NEO', 'NEO'),
    Coin(0x80000379, 'TOMO', 'TOMO'),
    Coin(0x8000037a, 'XSEL', 'Seln'),
    Coin(0x80000383, 'BCHA', 'BCHA'),
    Coin(0x80000384, 'LMO', 'Lumeneo'),
    Coin(0x80000388, '', 'Helium'),
    Coin(0x8000038b, 'FIS', 'StaFi'),
    Coin(0x80000394, 'META', 'Metadium'),
    Coin(0x80000395, 'FRA', 'Findora'),
    Coin(0x8000039d, 'DIP', 'Dipper Network'),
    Coin(0x800003a3, 'RUNE', 'THORChain (RUNE)'),
    Coin(0x800003bb, 'LTP', 'LifetionCoin'),
    Coin(0x800003ca, 'TWINS', 'TWINS'),
    Coin(0x800003dc, 'XAZAB', 'Xazab core'),
    Coin(0x800003dd, 'AIOZ', 'AIOZ'),
    Coin(0x800003e4, 'OKT', 'OKChain Token'),
    Coin(0x800003e5, 'SUM', 'Solidum'),
    Coin(0x800003e6, 'LBTC', 'Lightning Bitcoin'),
    Coin(0x800003e7, 'BCD', 'Bitcoin Diamond'),
    Coin(0x800003e8, 'BTN', 'Bitcoin New'),
    Coin(0x800003e9, 'TT', 'ThunderCore'),
    Coin(0x800003ea, 'BKT', 'BanKitt'),
    Coin(0x800003f2, 'HT', 'Huobi ECO Chain'),
    Coin(0x800003ff, 'ONE', 'HARMONY-ONE'),
    Coin(0x80000400, 'ONT', 'Ontology'),
    Coin(0x80000402, 'KEX', 'Kira Exchange Token'),
    Coin(0x80000403, 'MCM', 'Mochimo'),
    Coin(0x80000408, 'BTCR', 'BTCR'),
    Coin(0x80000457, 'BBC', 'Big Bitcoin'),
    Coin(0x80000460, 'RISE', 'RISE'),
    Coin(0x80000462, 'CMT', 'CyberMiles Token'),
    Coin(0x80000468, 'ETSC', 'Ethereum Social'),
    Coin(0x80000469, 'DFI', 'DeFiChain'),
    Coin(0x80000471, '\$DAG', 'Constellation Labs'),
    Coin(0x80000479, 'CDY', 'Bitcoin Candy'),
    Coin(0x80000539, 'DFC', 'Defcoin'),
    Coin(0x80000575, 'HYC', 'Hycon'),
    Coin(0x800005f4, '', 'Taler'),
    Coin(0x800005fd, 'BEAM', 'Beam'),
    Coin(0x80000650, 'ELF', 'AELF'),
    Coin(0x80000652, 'AUDL', 'AUDL'),
    Coin(0x80000654, 'ATH', 'Atheios'),
    Coin(0x8000066a, 'NEW', 'Newton'),
    Coin(0x80000698, 'BCX', 'BitcoinX'),
    Coin(0x800006c1, 'XTZ', 'Tezos'),
    Coin(0x800006f0, 'LBTC', 'Liquid BTC'),
    Coin(0x800006F8, 'JPYS', 'JPY Stablecoin'),
    Coin(0x80000717, 'ADA', 'Cardano'),
    Coin(0x80000743, 'TES', 'Teslacoin'),
    Coin(0x8000076b, 'SLPA', 'BCHA token'),
    Coin(0x8000076d, 'CLC', 'Classica'),
    Coin(0x8000077f, 'VIPS', 'VIPSTARCOIN'),
    Coin(0x80000786, 'CITY', 'City Coin'),
    Coin(0x800007b9, 'XMX', 'Xuma'),
    Coin(0x800007c0, 'TRTL', 'TurtleCoin'),
    Coin(0x800007c3, 'EGEM', 'EtherGem'),
    Coin(0x800007c5, 'HODL', 'HOdlcoin'),
    Coin(0x800007c6, 'PHL', 'Placeholders'),
    Coin(0x800007c7, 'SC', 'Sia'),
    Coin(0x800007cd, 'POLIS', 'Polis'),
    Coin(0x800007ce, 'XMCC', 'Monoeci'),
    Coin(0x800007cf, 'COLX', 'ColossusXT'),
    Coin(0x800007d0, 'GIN', 'GinCoin'),
    Coin(0x800007d1, 'MNP', 'MNPCoin'),
    Coin(0x800007e1, 'KIN', 'Kin'),
    Coin(0x800007e2, 'EOSC', 'EOSClassic'),
    Coin(0x800007e3, 'GBT', 'GoldBean Token'),
    Coin(0x800007e4, 'PKC', 'PKC'),
    Coin(0x80000800, 'MCASH', 'MCashChain'),
    Coin(0x80000801, 'TRUE', 'TrueChain'),
    Coin(0x80000840, 'IoTE', 'IoTE'),
    Coin(0x800008ad, 'ASK', 'ASK'),
    Coin(0x800008fd, 'QTUM', 'QTUM'),
    Coin(0x800008fe, 'ETP', 'Metaverse'),
    Coin(0x800008ff, 'GXC', 'GXChain'),
    Coin(0x80000900, 'CRP', 'CranePay'),
    Coin(0x80000901, 'ELA', 'Elastos'),
    Coin(0x80000922, 'SNOW', 'Snowblossom'),
    Coin(0x80000a0a, 'AOA', 'Aurora'),
    Coin(0x80000b4e, 'REOSC', 'REOSC Ecosystem'),
    Coin(0x80000bbb, 'LUX', 'LUX'),
    Coin(0x80000bd6, 'XHB', 'Hedera HBAR'),
    Coin(0x80000c05, 'COS', 'Contentos'),
    Coin(0x80000d35, 'DYN', 'Dynamic'),
    Coin(0x80000d37, 'SEQ', 'Sequence'),
    Coin(0x80000de0, 'DEO', 'Destocoin'),
    Coin(0x80000dec, 'DST', 'DeStream'),
    Coin(0x80000a9e, 'NAS', 'Nebulas'),
    Coin(0x80000b7d, 'BND', 'Blocknode'),
    Coin(0x80000ccc, 'CCC', 'CodeChain'),
    Coin(0x80000d31, 'ROI', 'ROIcoin'),
    Coin(0x80000fc8, 'FC8', 'FCH Network'),
    Coin(0x80001000, 'YEE', 'YeeCo'),
    Coin(0x8000107a, 'IOTA', 'IOTA'),
    Coin(0x80001092, 'AXE', 'Axe'),
    Coin(0x800010f7, 'XYM', 'Symbol'),
    Coin(0x80001480, 'FIC', 'FIC'),
    Coin(0x800014e9, 'HNS', 'Handshake'),
    Coin(0x800015b3, 'FUND', 'Unification'),
    Coin(0x8000167d, 'STX', 'Blockstack'),
    Coin(0x80001720, 'SLU', 'SILUBIUM'),
    Coin(0x800017ac, 'GO', 'GoChain GO'),
    Coin(0x80001a0a, 'BPA', 'Bitcoin Pizza'),
    Coin(0x80001a20, 'SAFE', 'SAFE'),
    Coin(0x80001b39, 'ROGER', 'TheHolyrogerCoin'),
    Coin(0x80001e61, 'BTV', 'Bitvote'),
    Coin(0x80001f40, 'SKY', 'Skycoin'),
    Coin(0x80002019, 'KLAY', 'KLAY'),
    Coin(0x80002093, 'BTQ', 'BitcoinQuark'),
    Coin(0x800020fc, 'XCH', 'Chia'),
    Coin(0x800022b8, 'SBTC', 'Super Bitcoin'),
    Coin(0x80002304, 'NULS', 'NULS'),
    Coin(0x80002327, 'BTP', 'Bitcoin Pay'),
    Coin(0x80002328, 'AVAX', 'Avalanche'),
    Coin(0x80002645, 'NRG', 'Energi'),
    Coin(0x800026a0, 'BTF', 'Bitcoin Faith'),
    Coin(0x8000270f, 'GOD', 'Bitcoin God'),
    Coin(0x80002710, 'FO', 'FIBOS'),
    Coin(0x80002833, 'BTR', 'Bitcoin Rhodium'),
    Coin(0x80002b67, 'ESS', 'Essentia One'),
    Coin(0x80003039, 'IPOS', 'IPOS'),
    Coin(0x8000312a, 'MINA', 'Mina'),
    Coin(0x80003333, 'BTY', 'BitYuan'),
    Coin(0x80003334, 'YCC', 'Yuan Chain Coin'),
    Coin(0x80003de5, 'SDGO', 'SanDeGo'),
    Coin(0x80003f35, 'XTX', 'Totem Live Network'),
    Coin(0x80004172, 'ARDR', 'Ardor'),
    Coin(0x80004add, 'SAFE', 'Safecoin'),
    Coin(0x80004adf, 'ZEL', 'ZelCash'),
    Coin(0x80004ae1, 'RITO', 'Ritocoin'),
    Coin(0x80004e44, 'XND', 'ndau'),
    Coin(0x800057e8, 'PWR', 'PWRcoin'),
    Coin(0x800062a4, 'BELL', 'Bellcoin'),
    Coin(0x80006476, 'CHX', 'Own'),
    Coin(0x8000797e, 'ESN', 'EtherSocial Network'),
    Coin(0x80007a69, '', 'ThePower.io'),
    Coin(0x80008288, 'TEO', 'Trust Eth reOrigin'),
    Coin(0x80008456, 'BTCS', 'Bitcoin Stake'),
    Coin(0x80008888, 'BTT', 'ByteTrade'),
    Coin(0x80009468, 'FXTC', 'FixedTradeCoin'),
    Coin(0x80009999, 'AMA', 'Amabig'),
    Coin(0x8000c06e, 'EVE', 'evan.network'),
    Coin(0x8000c0c0, 'STASH', 'STASH'),
    Coin(0x8000ce10, 'CELO', 'Celo'),
    Coin(0x80010000, 'KETH', 'Krypton World'),
    Coin(0x80012fd1, 'ZYN', 'Wethio'),
    Coin(0x80015b38, 'RYO', 'c0ban'),
    Coin(0x8001869f, 'WICC', 'Waykichain'),
    Coin(0x80019a91, 'STRAX', 'Strax'),
    Coin(0x80030fb1, 'AKA', 'Akroma'),
    Coin(0x80011000, 'GENOM', 'GENOM'),
    Coin(0x8003c301, 'ATS', 'ARTIS sigma1'),
    Coin(0x80067932, 'X42', 'x42'),
    Coin(0x800a2c2a, 'VITE', 'Vite'),
    Coin(0x800d9038, 'SEA', 'Second Exchange Alliance'),
    Coin(0x8011df89, 'ILT', 'iOlite'),
    Coin(0x8014095a, 'ETHO', 'Ether-1'),
    Coin(0x80140adc, 'XERO', 'Xerom'),
    Coin(0x801a2010, 'LAX', 'LAPO'),
    Coin(0x803be02b, 'EPK', 'EPIK Protocol'),
    Coin(0x80485944, 'HYD', 'Hydra Token'),
    Coin(0x80501949, 'BCO', 'BitcoinOre'),
    Coin(0x8050194a, 'BHD', 'BitcoinHD'),
    Coin(0x8050544e, 'PTN', 'PalletOne'),
    Coin(0x8057414e, 'WAN', 'Wanchain'),
    Coin(0x80579bfc, 'WAVES', 'Waves'),
    Coin(0x8073656d, 'SEM', 'Semux'),
    Coin(0x80737978, 'ION', 'ION'),
    Coin(0x80776772, 'WGR', 'WGR'),
    Coin(0x80776773, 'OBSR', 'OBServer'),
    Coin(0x80e6b280, 'XDS', 'XDS'),
    Coin(0x83adbc39, 'AQUA', 'Aquachain'),
    Coin(0x854c5638, 'HATCH', 'Hatch'),
    Coin(0x857ab1e1, 'kUSD', 'kUSD'),
    Coin(0x85f5e0fd, 'EQ', 'EQ'),
    Coin(0x85f5e0fe, 'FLUID', 'Fluid Chains'),
    Coin(0x85f5e0ff, 'QKC', 'QuarkChain')
  ];
}*/
