import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../service/coins_service.dart';
import '../viewmodel/coins_view_model.dart';

final _coinsViewModel = CoinsViewModel(
  service: CoinsService(
    Dio(
      BaseOptions(
        baseUrl: ServicePath.BASE_URL.rawValue,
      ),
    ),
  ),
);

class CoinsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoinPage'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return _coinsViewModel.isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: _coinsViewModel.coins.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_coinsViewModel.coins[index].name ?? ''),
                  ),
                );
        },
      ),
    );
  }
}
