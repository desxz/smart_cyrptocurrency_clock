import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../feature/coins/model/coins_model.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
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
            print(coin.current_price.toString());
            showDialog(
              context: context,
              builder: (_) => Expanded(
                child: AlertDialog(
                  actions: [
                    TextButton(onPressed: () {}, child: Text('No')),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                      ),
                      onPressed: () {},
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
                      Text('1 ${coin.name} : ${coin.current_price} USD'),
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
                          onSaved: (var value) {
                            if (value != null) {
                              if (int.parse(value) is int) {
                                print(value);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
