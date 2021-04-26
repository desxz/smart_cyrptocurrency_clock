import 'package:crypto_currency_app/feature/coins/model/coins_model.dart';
import 'package:dio/dio.dart';

abstract class ICoinsService {
  ICoinsService(this.dio);

  Future<List<Coin>> fetchData();

  final Dio dio;
}
