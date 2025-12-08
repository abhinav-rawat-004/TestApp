import 'package:commmerce/controller/data_controller.dart';
import 'package:commmerce/pages/todo_page.dart';
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
      body: Obx(() {
        return (controller.currentScreenIndex() == 0)
            ? (controller.isLoading()
                  ? const Center(child: CircularProgressIndicator())
                  : MyListView(productList: controller.products()))
            : (TodoPage());
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentScreenIndex(),
          onTap: (value) => controller.currentScreenIndex(value),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todo'),
          ],
        ),
      ),
      /* test posting
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.postData();
        },
        child: Icon(Icons.add),
      ),
      */
    );
  }
}
