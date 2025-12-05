import 'package:commmerce/model/product.dart';
import 'package:get/get.dart';

class DistinctProductController extends GetxController {
  late Product product; //no use for future reference when product is fetched using api 
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    product = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
    isLoading(false);
  }
}
