import 'package:crypto_currency_app/feature/coins/model/coins_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:select_dialog/select_dialog.dart';

import '../../../core/widget/custom_coin_card.dart';
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
      appBar: buildACoinsViewAppBar(),
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              SelectDialog.showModal<String>(
                context,
                label: "Crypto Currencies",
                titleStyle: TextStyle(color: Colors.black),
                showSearchBox: true,
                selectedValue: _coinsViewModel.ex2,
                backgroundColor: Colors.white,
                items: _coinsViewModel.getCoinListName(_coinsViewModel.coins),
                onChange: (String selected) {
                  _coinsViewModel.ex2 = selected;
                  print(_coinsViewModel.ex2);
                },
              );
            },
            child: Icon(Icons.add),
          );
        },
      ),
      body: buildCoinsViewBody(),
    );
  }

  Observer buildCoinsViewBody() {
    return Observer(
      builder: (_) {
        return _coinsViewModel.isLoading
            ? CircularProgressIndicator()
            : buildListViewCoins();
      },
    );
  }

  AppBar buildACoinsViewAppBar() {
    return AppBar(
      title: Text('CoinPage'),
      centerTitle: true,
    );
  }

  ListView buildListViewCoins() {
    return ListView.builder(
      itemCount: _coinsViewModel.coins.length,
      itemBuilder: (context, index) => buildDismissible(index),
    );
  }

  Dismissible buildDismissible(int index) {
    return Dismissible(
      background: buildDismissibleContainer(),
      key: Key(_coinsViewModel.coins[index].toString()),
      onDismissed: (direction) => _coinsViewModel.coins.removeAt(index),
      child: CoinCard(
        coin: _coinsViewModel.coins[index],
      ),
    );
  }

  Container buildDismissibleContainer() {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
