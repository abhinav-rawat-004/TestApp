import 'package:commmerce/controller/bottom_navbar_controller.dart';
import 'package:commmerce/controller/data_controller.dart';
import 'package:commmerce/pages/todo_page.dart';
import 'package:commmerce/view/listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends GetView<DataController> {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  // TODO: implement controller
  DataController get controller => Get.put(DataController());

  BottomNavbarController bottomNavbarController = Get.put(BottomNavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Obx(() {
        return (bottomNavbarController.currentScreenIndex() == 0)
            ? 
            (controller.isLoading()
                  ? const Center(child: CircularProgressIndicator())
                  : MyListView(productList: controller.products()))
            : (TodoPage());
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavbarController.currentScreenIndex(),
          onTap: (value) => bottomNavbarController.currentScreenIndex(value),
          items: bottomNavbarController.screens,
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
