// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoinsViewModel on _CoinsViewModelBase, Store {
  final _$coinsAtom = Atom(name: '_CoinsViewModelBase.coins');

  @override
  List<Coin> get coins {
    _$coinsAtom.reportRead();
    return super.coins;
  }

  @override
  set coins(List<Coin> value) {
    _$coinsAtom.reportWrite(value, super.coins, () {
      super.coins = value;
    });
  }

  final _$listedCoinsAtom = Atom(name: '_CoinsViewModelBase.listedCoins');

  @override
  ObservableList<Coin> get listedCoins {
    _$listedCoinsAtom.reportRead();
    return super.listedCoins;
  }

  @override
  set listedCoins(ObservableList<Coin> value) {
    _$listedCoinsAtom.reportWrite(value, super.listedCoins, () {
      super.listedCoins = value;
    });
  }

  final _$alarmedCoinsAtom = Atom(name: '_CoinsViewModelBase.alarmedCoins');

  @override
  ObservableList<Coin> get alarmedCoins {
    _$alarmedCoinsAtom.reportRead();
    return super.alarmedCoins;
  }

  @override
  set alarmedCoins(ObservableList<Coin> value) {
    _$alarmedCoinsAtom.reportWrite(value, super.alarmedCoins, () {
      super.alarmedCoins = value;
    });
  }

  final _$ex2Atom = Atom(name: '_CoinsViewModelBase.ex2');

  @override
  String? get ex2 {
    _$ex2Atom.reportRead();
    return super.ex2;
  }

  @override
  set ex2(String? value) {
    _$ex2Atom.reportWrite(value, super.ex2, () {
      super.ex2 = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CoinsViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetchsDataAsyncAction = AsyncAction('_CoinsViewModelBase.fetchsData');

  @override
  Future<void> fetchsData() {
    return _$fetchsDataAsyncAction.run(() => super.fetchsData());
  }

  final _$_CoinsViewModelBaseActionController =
      ActionController(name: '_CoinsViewModelBase');

  @override
  Coin findCoin(String name) {
    final _$actionInfo = _$_CoinsViewModelBaseActionController.startAction(
        name: '_CoinsViewModelBase.findCoin');
    try {
      return super.findCoin(name);
    } finally {
      _$_CoinsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String>? getCoinListName(List<Coin> coinList) {
    final _$actionInfo = _$_CoinsViewModelBaseActionController.startAction(
        name: '_CoinsViewModelBase.getCoinListName');
    try {
      return super.getCoinListName(coinList);
    } finally {
      _$_CoinsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_CoinsViewModelBaseActionController.startAction(
        name: '_CoinsViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CoinsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
listedCoins: ${listedCoins},
alarmedCoins: ${alarmedCoins},
ex2: ${ex2},
isLoading: ${isLoading}
    ''';
  }
}
