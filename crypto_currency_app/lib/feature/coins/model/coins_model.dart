import 'package:json_annotation/json_annotation.dart';

part 'coins_model.g.dart';

@JsonSerializable()
class Coin {
  String? id;
  String? symbol;
  String? name;
  String? image;
  var current_price;

  Coin({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.current_price,
  });

  Coin fromJson(Map<String, dynamic>? json) {
    return _$CoinFromJson(json ?? {});
  }

  Map<String, dynamic> toJson() {
    return _$CoinToJson(this);
  }

  @override
  String toString() {
    return 'Coin(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $current_price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coin &&
        other.id == id &&
        other.symbol == symbol &&
        other.name == name &&
        other.image == image &&
        other.current_price == current_price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        image.hashCode ^
        current_price.hashCode;
  }
}
