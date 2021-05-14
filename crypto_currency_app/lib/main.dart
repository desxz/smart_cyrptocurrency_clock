import 'package:crypto_currency_app/core/constants/navigation/navigation_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home: NotFoundNavigationWidget(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: NavigationConstants.LOGIN_VIEW,
    );
  }
}
