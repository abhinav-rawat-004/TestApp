import 'package:commmerce/controller/data_controller.dart';
import 'package:commmerce/pages/hompage.dart';
import 'package:commmerce/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DataController controller = Get.put(DataController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => MyHomePage(title: 'E-Commerce'),
        ),
        GetPage(name: '/product/page', page: () => ProductPage()),
      ],
      onInit: () {
        controller.fetchData();
        print(controller.products);
      },
    );
  }
}
