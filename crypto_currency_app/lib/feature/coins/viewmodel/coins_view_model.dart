import 'package:mobx/mobx.dart';

import '../model/coins_model.dart';
import '../service/ICoinsService.dart';

part 'coins_view_model.g.dart';

class CoinsViewModel = _CoinsViewModelBase with _$CoinsViewModel;

abstract class _CoinsViewModelBase with Store {
  @observable
  List<Coin> coins = [];

  @observable
  var listedCoins = ObservableList<Coin>();

  @observable
  var alarmedCoins = ObservableList<Coin>();

  @action
  Coin findCoin(String name) => coins.firstWhere((coin) => coin.name == name);

  ICoinsService service;

  _CoinsViewModelBase({
    required this.service,
  }) {
    fetchsData();
  }

  @action
  List<String>? getCoinListName(List<Coin> coinList) {
    var coinNames = <String>[];
    for (var iter in coinList) {
      coinNames.add(iter.name.toString());
    }
    return coinNames;
  }

  @observable
  String? ex2;

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
