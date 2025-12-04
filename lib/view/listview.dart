import 'package:commmerce/utils/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyListView extends StatelessWidget {
  final List productList;
  const MyListView({super.key, required this.productList});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.0),
      child: Obx(
        () => ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) => MyListTile(productDetails: productList[index]),
        ),
      ),
    );
  }
}
