import 'package:crypto_currency_app/feature/coins/service/coins_service.dart';
import 'package:crypto_currency_app/feature/coins/viewmodel/coins_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

final _coinsViewModel = CoinsViewModel(
  service: CoinsService(
    Dio(
      BaseOptions(
        baseUrl: ServicePath.BASE_URL.rawValue,
      ),
    ),
  ),
);

class AlarmView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Screen'),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _coinsViewModel.alarmedCoins.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(
                _coinsViewModel.alarmedCoins[index].name.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      }),
    );
  }
}
