import 'dart:io';

import 'package:cryptocurrency_mobile/view/home_screen/model/button_model.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'home_screen_viewmodel.g.dart';

class HomeScreenViewModel = _HomeScreenViewModelBase with _$HomeScreenViewModel;

abstract class _HomeScreenViewModelBase with Store {
  @observable
  List<Button> buttons = [];

  @observable
  PageState pageState = PageState.NORMAL;

  final url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  @observable
  bool isServiceRequestLoading = false;

  @action
  Future<void> getAllPost2() async {
    pageState = PageState.LOADING;

    try {
      final response = await Dio().get(url);
      if (response.statusCode == HttpStatus.ok) {
        final responseBody = response.data as List;
        buttons = responseBody.map((e) => Button.fromMap(e)).toList();
        pageState = PageState.SUCCESS;
      }
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }

  @action
  void changeRequest() {
    isServiceRequestLoading = !isServiceRequestLoading;
  }
}

enum PageState {
  LOADING,
  ERROR,
  SUCCESS,
  NORMAL,
}
