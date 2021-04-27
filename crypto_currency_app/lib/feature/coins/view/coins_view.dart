import 'package:crypto_currency_app/feature/coins/service/coins_service.dart';
import 'package:crypto_currency_app/feature/coins/viewmodel/coins_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CoinsView extends StatelessWidget {
  final _coinsViewModel = CoinsViewModel(
    service: CoinsService(
      Dio(
        BaseOptions(
          baseUrl: ServicePath.BASE_URL.rawValue,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoinPage'),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) => Text('DATA')),
    );
  }
}
