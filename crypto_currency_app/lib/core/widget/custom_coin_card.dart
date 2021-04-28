import 'package:flutter/material.dart';

import '../../feature/coins/model/coins_model.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
  const CoinCard({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(coin.name ?? ''),
        subtitle: Text(coin.symbol!.toUpperCase()),
      ),
    );
  }
}
