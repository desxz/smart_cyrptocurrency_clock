import 'dart:convert';

import 'package:flutter/material.dart';

class Button {
  String coinName;
  double height;
  double width;
  Color color;
  String icon;

  Button({
    this.coinName,
    this.height,
    this.width,
    this.color,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'coinName': coinName,
      'height': height,
      'width': width,
      'color': color.value,
      'icon': icon,
    };
  }

  factory Button.fromMap(Map<String, dynamic> map) {
    return Button(
      coinName: map['coinName'],
      height: map['height'],
      width: map['width'],
      color: Color(map['color']),
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Button.fromJson(String source) => Button.fromMap(json.decode(source));
}

List<Map<String, dynamic>> buttons = [
  {
    "coinName": "BITCOIN",
    "height": '',
    "width": 0.0,
    "color": Color(0xFFF2A900),
    "icon": "assets/BTC.svg",
  },
  {
    "coinName": "ETHEREUM",
    "height": "0",
    "width": 0.0,
    "color": Color(0xFF191921),
    "icon": "assets/Etherium.svg",
  },
  {
    "coinName": "RIPPLE",
    "height": "",
    "width": 0.0,
    "color": Color(0xFF00AAE4),
    "icon": "assets/Ripple.svg",
  },
  {
    "coinName": "DOGECOIN",
    "height": "",
    "width": 0.0,
    "color": Color(0xFFCB9800),
    "icon": "assets/Dogecoin.svg",
  },
  {
    "coinName": "LITECOIN",
    "height": "",
    "width": 0.0,
    "color": Color(0xFF00AEFF),
    "icon": "assets/litecoin.svg",
  },
  {
    "coinName": "TETHER",
    "height": "",
    "width": 0.0,
    "color": Color(0xFF26A17B),
    "icon": "assets/Tether.svg",
  },
  {
    "coinName": "BINANCE C.",
    "height": "",
    "width": 0.0,
    "color": Color(0xFFF3BA2F),
    "icon": "assets/Binance.svg",
  },
  {
    "coinName": "BITTORRENT",
    "height": "",
    "width": 200.0,
    "color": Color(0xFF000000),
    "icon": "assets/Bittorrent.svg",
  },
  {
    "coinName": "ALARM",
    "height": "",
    "width": 0.0,
    "color": Color(0xFF000000),
    "icon": "assets/exit.svg",
  },
];
