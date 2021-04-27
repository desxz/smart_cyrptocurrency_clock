// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return Coin(
    id: json['id'] as String?,
    symbol: json['symbol'] as String?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    currentPrice: json['currentPrice'] as int?,
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
    };
