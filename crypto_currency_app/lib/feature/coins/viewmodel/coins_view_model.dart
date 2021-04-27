import 'package:mobx/mobx.dart';

import '../model/coins_model.dart';
import '../service/ICoinsService.dart';

part 'coins_view_model.g.dart';

class CoinsViewModel = _CoinsViewModelBase with _$CoinsViewModel;

abstract class _CoinsViewModelBase with Store {
  @observable
  List<Coin> coins = [];

  ICoinsService service;

  _CoinsViewModelBase({
    required this.service,
  }) {
    fetchsData();
  }

  @observable
  bool isLoading = true;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchsData() async {
    coins = await service.fetchData();
    changeLoading();
  }
}
