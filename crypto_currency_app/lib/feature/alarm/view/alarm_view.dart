import 'package:crypto_currency_app/feature/alarm/viewmodel/alarm_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AlarmView extends StatelessWidget {
  final _alarmViewModel = AlarmViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.text_snippet),
        title: Text('Alarm Screen'),
      ),
      body: Observer(builder: (_) {
        return GridView.builder(
            itemCount: _alarmViewModel.notificationedCoins.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title:
                        Text(_alarmViewModel.notificationedCoins[index].name!),
                  ),
                ));
      }),
    );
  }
}
