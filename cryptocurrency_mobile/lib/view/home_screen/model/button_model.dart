import 'dart:convert';

class Button {
  var id;
  var symbol;
  var name;
  var image;
  var currentPrice;
  var marketCap;
  var marketCapRank;
  var fullyDilutedValuation;
  var totalVolume;
  var high24h;
  var low24h;
  var priceChange24h;
  var priceChangePercentage24h;
  var marketCapChange24h;
  var marketCapChangePercentage24h;
  var circulatingSupply;
  var totalSupply;
  var maxSupply;
  var ath;
  var athChangePercentage;
  var athDate;
  var atl;
  var atlChangePercentage;
  var atlDate;
  var roi;
  var lastUpdated;

  Button({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'currentPrice': currentPrice,
      'marketCap': marketCap,
      'marketCapRank': marketCapRank,
      'fullyDilutedValuation': fullyDilutedValuation,
      'totalVolume': totalVolume,
      'high24h': high24h,
      'low24h': low24h,
      'priceChange24h': priceChange24h,
      'priceChangePercentage24h': priceChangePercentage24h,
      'marketCapChange24h': marketCapChange24h,
      'marketCapChangePercentage24h': marketCapChangePercentage24h,
      'circulatingSupply': circulatingSupply,
      'totalSupply': totalSupply,
      'maxSupply': maxSupply,
      'ath': ath,
      'athChangePercentage': athChangePercentage,
      'athDate': athDate,
      'atl': atl,
      'atlChangePercentage': atlChangePercentage,
      'atlDate': atlDate,
      'roi': roi,
      'lastUpdated': lastUpdated,
    };
  }

  factory Button.fromMap(Map<String, dynamic> map) {
    return Button(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      image: map['image'],
      currentPrice: map['currentPrice'],
      marketCap: map['marketCap'],
      marketCapRank: map['marketCapRank'],
      fullyDilutedValuation: map['fullyDilutedValuation'],
      totalVolume: map['totalVolume'],
      high24h: map['high24h'],
      low24h: map['low24h'],
      priceChange24h: map['priceChange24h'],
      priceChangePercentage24h: map['priceChangePercentage24h'],
      marketCapChange24h: map['marketCapChange24h'],
      marketCapChangePercentage24h: map['marketCapChangePercentage24h'],
      circulatingSupply: map['circulatingSupply'],
      totalSupply: map['totalSupply'],
      maxSupply: map['maxSupply'],
      ath: map['ath'],
      athChangePercentage: map['athChangePercentage'],
      athDate: map['athDate'],
      atl: map['atl'],
      atlChangePercentage: map['atlChangePercentage'],
      atlDate: map['atlDate'],
      roi: map['roi'],
      lastUpdated: map['lastUpdated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Button.fromJson(String source) => Button.fromMap(json.decode(source));
}
