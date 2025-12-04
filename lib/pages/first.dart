import 'package:flutter/material.dart';
import 'package:get/get.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          Get.toNamed('/home');
        }, child: Text("Login")),
      ),
    );
  }
}