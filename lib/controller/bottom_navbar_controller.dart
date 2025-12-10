import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  RxInt currentScreenIndex = 0.obs;
  List<BottomNavigationBarItem> screens = [
    BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todo'),
  ];
}
