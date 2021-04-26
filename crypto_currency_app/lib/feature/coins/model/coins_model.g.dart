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
    marketCap: json['marketCap'] as int?,
    marketCapRank: json['marketCapRank'] as int?,
    fullyDilutedValuation: json['fullyDilutedValuation'] as int?,
    totalVolume: json['totalVolume'] as int?,
    high24h: json['high24h'] as int?,
    low24h: json['low24h'] as int?,
    priceChange24h: (json['priceChange24h'] as num?)?.toDouble(),
    priceChangePercentage24h:
        (json['priceChangePercentage24h'] as num?)?.toDouble(),
    marketCapChange24h: json['marketCapChange24h'] as int?,
    marketCapChangePercentage24h:
        (json['marketCapChangePercentage24h'] as num?)?.toDouble(),
    circulatingSupply: json['circulatingSupply'] as int?,
    totalSupply: json['totalSupply'] as int?,
    maxSupply: json['maxSupply'] as int?,
    ath: json['ath'] as int?,
    athChangePercentage: (json['athChangePercentage'] as num?)?.toDouble(),
    athDate: json['athDate'] as String?,
    atl: (json['atl'] as num?)?.toDouble(),
    atlChangePercentage: (json['atlChangePercentage'] as num?)?.toDouble(),
    atlDate: json['atlDate'] as String?,
    roi: json['roi'] as String?,
    lastUpdated: json['lastUpdated'] as String?,
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'marketCap': instance.marketCap,
      'marketCapRank': instance.marketCapRank,
      'fullyDilutedValuation': instance.fullyDilutedValuation,
      'totalVolume': instance.totalVolume,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'priceChange24h': instance.priceChange24h,
      'priceChangePercentage24h': instance.priceChangePercentage24h,
      'marketCapChange24h': instance.marketCapChange24h,
      'marketCapChangePercentage24h': instance.marketCapChangePercentage24h,
      'circulatingSupply': instance.circulatingSupply,
      'totalSupply': instance.totalSupply,
      'maxSupply': instance.maxSupply,
      'ath': instance.ath,
      'athChangePercentage': instance.athChangePercentage,
      'athDate': instance.athDate,
      'atl': instance.atl,
      'atlChangePercentage': instance.atlChangePercentage,
      'atlDate': instance.atlDate,
      'roi': instance.roi,
      'lastUpdated': instance.lastUpdated,
    };
