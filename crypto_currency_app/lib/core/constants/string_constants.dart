class StringConstant {
  static StringConstant? _instace;

  static StringConstant get instance => _instace ??= StringConstant._init();

  StringConstant._init();

  final alertDialogLabel = 'Crypto Currencies';
  final coinAlreadyInTheList = 'Coin already in the list!';
  final ok = 'OK';
  final cryptoCoins = 'CoinPage';
}
