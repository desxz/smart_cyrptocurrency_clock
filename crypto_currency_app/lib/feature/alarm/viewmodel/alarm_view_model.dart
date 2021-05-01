import 'package:crypto_currency_app/feature/coins/model/coins_model.dart';
import 'package:mobx/mobx.dart';
part 'alarm_view_model.g.dart';

class AlarmViewModel = _AlarmViewModelBase with _$AlarmViewModel;

abstract class _AlarmViewModelBase with Store {
  @observable
  ObservableList<Coin> notificationedCoins = ObservableList<Coin>();
}
