import 'package:json_annotation/json_annotation.dart';

part 'coins_model.g.dart';

@JsonSerializable()
class Coin {
  String? id;
  String? symbol;
  String? name;
  String? image;
  int? currentPrice;

  Coin({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
  });

  Coin fromJson(Map<String, dynamic>? json) {
    return _$CoinFromJson(json ?? {});
  }

  Map<String, dynamic> toJson() {
    return _$CoinToJson(this);
  }
}
