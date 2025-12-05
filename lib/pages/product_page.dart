import 'package:commmerce/controller/distinct_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<DistinctProductController> {
  const ProductPage({super.key});

  @override
  DistinctProductController get controller =>
      Get.put(DistinctProductController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('E-Commerce'),
      ),
      body: Obx(() {
        return (controller.product.isNull)
            ? Center(child: Text('Product not Available'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: PageView.builder(
                            itemCount: 5, //Cant scroll with one item
                            //itemCount: product.images.length
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Hero(
                              tag: 'image${controller.product.id}',
                              child: Image.network(
                                //product.images[index],
                                controller.product.images[0], //As only one image is returned by api
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        Divider(),

                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                controller.product.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                              ),
                              Text(
                                controller.product.description,
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(height: 30.0),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Rating : ',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '★${controller.product.rating.toString()}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: (controller.product.rating > 4.2)
                                          ? Colors.green[400]
                                          : Colors.red[400],
                                    ),
                                  ),
                                ],
                              ),
                              // ListView.builder(
                              //   itemCount: controller.product.reviews.length,
                              //   itemBuilder: 
                              //   (context,index) => ListTile(
                              //     isThreeLine: true,
                              //     title: Text('${controller.product.reviews[index].reviewerName} ★${controller.product.reviews[index].rating}'),
                              //     subtitle: Text(controller.product.reviews[index].comment),
                              //   )
                              // )


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    onPressed: () {
                      Get.back();
                    },
                    minWidth: screenWidth,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    child: Text(
                      'Buy For : ₹${(controller.product.price * 80).round().toString()}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
