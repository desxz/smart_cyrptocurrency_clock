class StringConstant {
  static StringConstant? _instace;

  static StringConstant get instance => _instace ??= StringConstant._init();

  StringConstant._init();

  final alertDialogLabel = 'Crypto Currencies';
  final coinAlreadyInTheList = 'Coin already in the list!';
  final ok = 'OK';
  final cryptoCoins = 'CoinPage';
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final RegExp nameSurnameRegex = RegExp('[a-zA-Z]');
}
