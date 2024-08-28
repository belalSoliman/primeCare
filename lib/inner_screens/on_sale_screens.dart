import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/no_product_onsale.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/on_sale_widget.dart';

class OnSaleScreens extends StatelessWidget {
  const OnSaleScreens({super.key});

  static const routeName = '/OnSaleScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('On Sale Items'),
      ),
      body: GridView.count(
        childAspectRatio: 1,
        crossAxisCount: 2,
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
