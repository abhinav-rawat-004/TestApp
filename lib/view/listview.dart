import 'package:commmerce/model/product.dart';
import 'package:commmerce/utils/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final List<Product> productList;
  const MyListView({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: productList.length,
        itemBuilder: (context, index) =>
            MyListTile(productDetails: productList[index]),
      ),
    );
  }
}
