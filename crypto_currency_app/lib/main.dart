import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'feature/tab/app_tab_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  //await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AppTabView(),
    );
  }
}
