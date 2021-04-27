import 'package:flutter/material.dart';

import '../alarm/view/alarm_view.dart';
import '../coins/view/coins_view.dart';

class AppTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                icon: Icon(Icons.money_off, color: Colors.black),
              ),
              Tab(
                icon: Icon(Icons.alarm, color: Colors.black),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CoinsView(),
            AlarmView(),
          ],
        ),
      ),
    );
  }
}
