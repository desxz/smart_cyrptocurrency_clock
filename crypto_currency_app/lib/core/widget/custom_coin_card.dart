import 'package:crypto_currency_app/feature/coins/service/coins_service.dart';
import 'package:crypto_currency_app/feature/coins/viewmodel/coins_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../feature/coins/model/coins_model.dart';

final _coinsViewModel = CoinsViewModel(
  service: CoinsService(
    Dio(
      BaseOptions(
        baseUrl: ServicePath.BASE_URL.rawValue,
      ),
    ),
  ),
);

// ignore: must_be_immutable
class CoinCard extends StatelessWidget {
  Coin coin;
  CoinCard({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(coin.name ?? ''),
        subtitle: Text(coin.symbol!.toUpperCase()),
        trailing: IconButton(
          icon: Icon(Icons.alarm),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No')),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Yes',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
                title: Text('${coin.name} Alert'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('1 ${coin.name} : \$${coin.current_price}'),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.rate_review),
                          hintText: 'Enter price to notification.',
                        ),
                        onSaved: (value) {
                          _coinsViewModel.alarmedCoins.add(coin);
                          print(_coinsViewModel.alarmedCoins);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
