import 'package:commmerce/controller/data_controller.dart';
import 'package:commmerce/view/listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends GetView<DataController> {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  DataController get controller => Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Obx(
        () => controller.isLoading()
            ? const Center(child: CircularProgressIndicator())
            : MyListView(productList: controller.products()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print(fetchedData?.products[0]);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
