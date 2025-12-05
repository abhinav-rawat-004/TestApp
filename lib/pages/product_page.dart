import 'package:commmerce/dao/api.dart';
import 'package:commmerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('E-Commerce'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              itemCount: 5, //Cant scroll with one item
              //itemCount: product.images.length
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => 
                Image.network(
                  //product.images[index],  
                  product.images[0],  //As only one image is returned by api
                  fit: BoxFit.contain,
                ),
            ),
          ),
          Divider(),
      
      
          // PageView.builder(
          //   itemCount: product.images.length,
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) => 
          //   SizedBox(
          //     height: MediaQuery.of(context).size.height * 0.3,
          //     width: MediaQuery.of(context).size.width,
          //     child: Image.network(product.thumbnail),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
                Text(product.description, style: TextStyle(fontSize: 20.0)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Api _api = Api();
          _api.getProductOne();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
