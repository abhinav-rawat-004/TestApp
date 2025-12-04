import 'package:commmerce/model/product.dart';
import 'package:dio/dio.dart';

class Api {
  final dio = Dio(
    BaseOptions(
      receiveTimeout: Duration(milliseconds: 4000),
    ),
  );

  Future<Products?> getProducts() async {
    try {
      final Response response = await dio.get('https://dummyjson.com/products');
      print(response.data);
      return Products.fromJson(response.data);
    } on DioException catch (error) {
      print(error.message);
      return null;
    }
  }

  Future<void> getProductOne() async {
    try {
      final Response response = await dio.get('https://dummyjson.com/products/1');
      print(response.data);
    } on DioException catch (error) {
      print(error.message);
    }
  }

  
}
