import 'package:commmerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListTile extends StatelessWidget {
  final Product productDetails;
  const MyListTile({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/product/page', arguments: productDetails);
      },
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        borderOnForeground: true,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.network(
                  productDetails.thumbnail,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetails.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      productDetails.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      productDetails.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
