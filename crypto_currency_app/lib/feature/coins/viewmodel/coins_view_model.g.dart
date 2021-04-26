// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoinsViewModel on _CoinsViewModelBase, Store {
  final _$coinsAtom = Atom(name: '_CoinsViewModelBase.coins');

  @override
  Future<List<Coin>> get coins {
    _$coinsAtom.reportRead();
    return super.coins;
  }

  @override
  set coins(Future<List<Coin>> value) {
    _$coinsAtom.reportWrite(value, super.coins, () {
      super.coins = value;
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

  final _$_CoinsViewModelBaseActionController =
      ActionController(name: '_CoinsViewModelBase');

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
  void fetchData() {
    final _$actionInfo = _$_CoinsViewModelBaseActionController.startAction(
        name: '_CoinsViewModelBase.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_CoinsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
isLoading: ${isLoading}
    ''';
  }
}
