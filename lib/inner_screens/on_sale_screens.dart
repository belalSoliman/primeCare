import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/on_sale_widget.dart';

class OnSaleScreens extends StatelessWidget {
  const OnSaleScreens({super.key});

  static const routeName = '/OnSaleScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('On Sale Items'),
      ),
      body: GridView.count(
        childAspectRatio: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(20, (index) {
          return const OnSaleWidget(
            imageUrl: "assets/category_assets/cat-6.png",
            title: "On Sale",
            originalPrice: 5.99,
            salePrice: 10.00,
          );
        }),
      ),
    );
  }
}
