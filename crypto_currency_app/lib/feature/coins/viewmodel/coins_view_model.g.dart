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

  final _$serviceStatusAtom = Atom(name: '_CoinsViewModelBase.serviceStatus');

  @override
  ServiceStatus get serviceStatus {
    _$serviceStatusAtom.reportRead();
    return super.serviceStatus;
  }

  @override
  set serviceStatus(ServiceStatus value) {
    _$serviceStatusAtom.reportWrite(value, super.serviceStatus, () {
      super.serviceStatus = value;
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
  void refreshListedCoins(ObservableList<Coin> list) {
    final _$actionInfo = _$_CoinsViewModelBaseActionController.startAction(
        name: '_CoinsViewModelBase.refreshListedCoins');
    try {
      return super.refreshListedCoins(list);
    } finally {
      _$_CoinsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
listedCoins: ${listedCoins},
serviceStatus: ${serviceStatus},
alarmedCoins: ${alarmedCoins},
ex2: ${ex2}
    ''';
  }
}
