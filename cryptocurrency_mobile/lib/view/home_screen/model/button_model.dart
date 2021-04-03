import 'dart:convert';

import 'package:flutter/material.dart';

class Button {
  String coinName;
  int height;
  int width;
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
