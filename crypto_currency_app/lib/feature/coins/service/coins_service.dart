import 'dart:io';

import 'package:dio/src/dio.dart';

import '../../../core/exception/service_path_not_defined_exception.dart';
import '../model/coins_model.dart';
import 'ICoinsService.dart';

class CoinsService extends ICoinsService {
  CoinsService(Dio dio) : super(dio);

  @override
  Future<List<Coin>> fetchData() async {
    final response = await dio.get(ServicePath.MARKET.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data;
      if (responseData is List) {
        return responseData.map<Coin>((e) => Coin().fromJson(e)).toList();
      }
    }
    return [];
  }
}

enum ServicePath { MARKET, BASE_URL }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.MARKET:
        return '/coins/markets?vs_currency=usd&per_page=250&page=1&sparkline=false';
      case ServicePath.BASE_URL:
        return 'https://api.coingecko.com/api/v3';
      default:
        throw ServicePathNotDefinedException(this);
    }
  }
}
