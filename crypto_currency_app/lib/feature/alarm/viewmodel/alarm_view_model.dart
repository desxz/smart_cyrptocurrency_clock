import 'package:mobx/mobx.dart';

import '../../coins/model/coins_model.dart';

part 'alarm_view_model.g.dart';

class AlarmViewModel = _AlarmViewModelBase with _$AlarmViewModel;

abstract class _AlarmViewModelBase with Store {
  @observable
  ObservableList<Coin> notificationedCoins = ObservableList<Coin>();
}
