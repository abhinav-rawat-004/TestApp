import 'package:commmerce/dao/api.dart';
import 'package:commmerce/model/product.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  RxList products = [].obs;

  fetchData() async {
    final Api api = Api();
    Products? data = await api.getProducts();
    products.value = data!.products;
  }
}
