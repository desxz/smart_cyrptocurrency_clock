// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenViewModel on _HomeScreenViewModelBase, Store {
  final _$buttonsAtom = Atom(name: '_HomeScreenViewModelBase.buttons');

  @override
  List<Button> get buttons {
    _$buttonsAtom.reportRead();
    return super.buttons;
  }

  @override
  set buttons(List<Button> value) {
    _$buttonsAtom.reportWrite(value, super.buttons, () {
      super.buttons = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_HomeScreenViewModelBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$isServiceRequestLoadingAtom =
      Atom(name: '_HomeScreenViewModelBase.isServiceRequestLoading');

  @override
  bool get isServiceRequestLoading {
    _$isServiceRequestLoadingAtom.reportRead();
    return super.isServiceRequestLoading;
  }

  @override
  set isServiceRequestLoading(bool value) {
    _$isServiceRequestLoadingAtom
        .reportWrite(value, super.isServiceRequestLoading, () {
      super.isServiceRequestLoading = value;
    });
  }

  final _$getAllPost2AsyncAction =
      AsyncAction('_HomeScreenViewModelBase.getAllPost2');

  @override
  Future<void> getAllPost2() {
    return _$getAllPost2AsyncAction.run(() => super.getAllPost2());
  }

  final _$_HomeScreenViewModelBaseActionController =
      ActionController(name: '_HomeScreenViewModelBase');

  @override
  void changeRequest() {
    final _$actionInfo = _$_HomeScreenViewModelBaseActionController.startAction(
        name: '_HomeScreenViewModelBase.changeRequest');
    try {
      return super.changeRequest();
    } finally {
      _$_HomeScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttons: ${buttons},
pageState: ${pageState},
isServiceRequestLoading: ${isServiceRequestLoading}
    ''';
  }
}
