import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListTile extends StatelessWidget {
  final Map productDetails;
  const MyListTile({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/product/page',
          arguments: {'title': productDetails['title'], 'description': productDetails['description']},
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        borderOnForeground: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 150.0,
              width: 150.0,
              child: Container(color: Colors.redAccent),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDetails['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    productDetails['description']
                  ),
                  Text(
                    productDetails['price'],
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
    );
  }
}
