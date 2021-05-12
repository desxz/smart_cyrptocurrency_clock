import 'package:crypto_currency_app/feature/tab/app_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../feature/alarm/view/alarm_view.dart';
import '../../../feature/coins/view/coins_view.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../exception/widget/navigation_path_not_found_widget.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.COINS_VIEW:
        return normalNavigate(CoinsView());
      case NavigationConstants.ALARM_VIEW:
        return normalNavigate(AlarmView());
      case NavigationConstants.TAB_VIEW:
        return normalNavigate(AppTabView());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
