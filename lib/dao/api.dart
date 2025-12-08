import 'package:commmerce/model/product.dart';
import 'package:dio/dio.dart';

class Api {
  final dio = Dio(BaseOptions(receiveTimeout: Duration(milliseconds: 4000)));

  Future<Products?> getProducts() async {
    try {
      final Response response = await dio.get('https://dummyjson.com/products');
      return Products.fromJson(response.data);
    } on DioException catch (error) {
      print(error.message);
      return null;
    }
  }
/* Testing post,put,delete
  Future<void> postData() async {
    try {
      final Response response = await dio.put(
        'https://dummyjson.com/products/add', data: {
          'id' : '10202',
          'title' : 'BMW Pencil'
        }
      );

      print(response.statusCode);
      print(response.statusMessage);
    } on DioException catch (error) {
      print('Error : ${error}');
    }
  }

  Future<void> updateData() async {
    try {
      final Response response = await dio.put(
        'https://dummyjson.com/products/1', data: {
          'id' : '1',
          'title' : 'BMW Pencil'
        }
      );

      print(response.statusCode);
      print(response.statusMessage);
    } on DioException catch (error) {
      print('Error : ${error}');
    }
  }

  Future<void> deleteData() async {
    try {
      final Response response = await dio.delete(
        'https://dummyjson.com/posts/1'
      );

      print(response.statusCode);
      print(response.statusMessage);
    } on DioException catch (error) {
      print('Error : ${error}');
    }
  }
  */

  Future<void> getProductOne() async {
    try {
      final Response response = await dio.get(
        'https://dummyjson.com/products/1',
      );
      print(response.data);
    } on DioException catch (error) {
      print(error.message);
    }
  }
}

