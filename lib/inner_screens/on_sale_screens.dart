import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/on_sale_widget.dart';

class OnSaleScreens extends StatefulWidget {
  const OnSaleScreens({super.key});
  static const routeName = '/OnSaleScreen';

  @override
  State<OnSaleScreens> createState() => _OnSaleScreensState();
}

class _OnSaleScreensState extends State<OnSaleScreens> {
  // Define the onSaleItems list as a class variable
  final List<Map<String, dynamic>> onSaleItems = [
    {
      'imageUrl': 'assets/category_assets/cat-1.png',
      'title': 'Product 1',
      'originalPrice': 99.99,
      'salePrice': 79.99,
    },
    {
      'imageUrl': 'assets/category_assets/cat-1.png',
      'title': 'Product 2',
      'originalPrice': 99.99,
      'salePrice': 79.99,
    },
    {
      'imageUrl': 'assets/category_assets/cat-1.png',
      'title': 'Product 3',
      'originalPrice': 99.99,
      'salePrice': 79.99,
    },
    {
      'imageUrl': 'assets/category_assets/cat-1.png',
      'title': 'Product 4',
      'originalPrice': 99.99,
      'salePrice': 79.99,
    },
    {
      'imageUrl': 'assets/category_assets/cat-1.png',
      'title': 'Product 5',
      'originalPrice': 99.99,
      'salePrice': 79.99,
    },
    {
      'imageUrl': 'assets/category_assets/cat-1.png',
      'title': 'Product 6',
      'originalPrice': 99.99,
      'salePrice': 79.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: onSaleItems.length,
        itemBuilder: (context, index) {
          final item = onSaleItems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: OnSaleWidget(
              imageUrl: item['imageUrl'],
              title: item['title'],
              originalPrice: item['originalPrice'],
              salePrice: item['salePrice'],
            ),
          );
        },
      ),
    );
  }
}
