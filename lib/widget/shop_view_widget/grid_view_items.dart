import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/widget/product_widget_view_final.dart';

import 'package:provider/provider.dart';

class GridViewItems extends StatefulWidget {
  const GridViewItems({super.key});

  @override
  State<GridViewItems> createState() => _GridViewItemsState();
}

class _GridViewItemsState extends State<GridViewItems> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: .7,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        children: List.generate(
            productProvider.getProducts.length < 4
                ? productProvider.getProducts.length
                : 4, (index) {
          return ChangeNotifierProvider.value(
            value: productProvider.getProducts[index],
            child: ProductCard(onPress: () {}),
          );
        }));
  }
}
