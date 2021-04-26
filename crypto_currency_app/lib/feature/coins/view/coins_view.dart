import 'package:flutter/material.dart';

class CoinsView extends StatelessWidget {
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
