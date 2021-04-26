import 'package:crypto_currency_app/feature/coins/model/coins_model.dart';
import 'package:mobx/mobx.dart';

import 'package:crypto_currency_app/feature/coins/service/ICoinsService.dart';

part 'coins_view_model.g.dart';

class CoinsViewModel = _CoinsViewModelBase with _$CoinsViewModel;

abstract class _CoinsViewModelBase with Store {
  ICoinsService service;

  _CoinsViewModelBase({
    required this.service,
  }) {
    fetchData();
  }

  @observable
  Future<List<Coin>> coins = [] as Future<List<Coin>>;

  @observable
  bool isLoading = true;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void fetchData() {
    coins = service.fetchData();
    changeLoading();
  }
}
