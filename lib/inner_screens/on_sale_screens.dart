import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';

import 'package:pharnacy_trust/widget/shop_view_widget/on_sale_widget.dart';
import 'package:provider/provider.dart';

class OnSaleScreens extends StatelessWidget {
  const OnSaleScreens({super.key});

  static const routeName = '/OnSaleScreen';

  @override
  Widget build(BuildContext context) {
    final onSaleProduct = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('On Sale Items'),
      ),
      body: GridView.count(
        childAspectRatio: 1,
        crossAxisCount: 2,
        children:
            List.generate(onSaleProduct.getOnSaleProducts.length, (index) {
          return ChangeNotifierProvider.value(
              value: onSaleProduct.getOnSaleProducts[index],
              child: const OnSaleWidget());
        }),
      ),
    );
  }
}
