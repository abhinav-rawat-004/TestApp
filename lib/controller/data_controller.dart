import 'package:commmerce/dao/api.dart';
import 'package:commmerce/model/product.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading(true);
    try {
      final Api api = Api();
      Products? data = await api.getProducts();
      products.value = data!.products;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
