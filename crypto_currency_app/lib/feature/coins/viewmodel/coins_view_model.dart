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
  ServiceStatus serviceStatus = ServiceStatus.NORMAL;

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

  @action
  void refreshListedCoins(ObservableList<Coin> list) {
    for (var coinInList in list) {
      var findedCoin = findCoin(coinInList.name!);
      print(findedCoin.current_price);
      coinInList.current_price = findedCoin.current_price;
    }
    print(list);
  }

  @observable
  String? ex2;

  @action
  Future<void> fetchsData() async {
    serviceStatus = ServiceStatus.LOADING;
    coins = await service.fetchData();
    if (coins.isEmpty) {
      serviceStatus = ServiceStatus.ERROR;
    } else {
      serviceStatus = ServiceStatus.OK;
    }
  }

  Future<void> refreshData() async {
    await fetchsData();
    refreshListedCoins(listedCoins);
  }
}

enum ServiceStatus {
  LOADING,
  OK,
  ERROR,
  NORMAL,
}
