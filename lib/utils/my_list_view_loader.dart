import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyListViewLoader extends StatefulWidget {
  const MyListViewLoader({super.key});

  @override
  State<MyListViewLoader> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListViewLoader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5.0,
          borderOnForeground: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image placeholder
              Container(height: 150.0, width: 150.0, color: Colors.grey[300]),
              // Text placeholders
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title placeholder
                    Container(
                      width: double.infinity,
                      height: 24,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.only(bottom: 8),
                    ),
                    // Description placeholder
                    Container(
                      width: 200,
                      height: 16,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.only(bottom: 8),
                    ),
                    // Price placeholder
                    Container(width: 100, height: 18, color: Colors.grey[300]),
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
