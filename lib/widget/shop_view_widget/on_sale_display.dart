import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/product_provider.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/on_sale_widget.dart';
import 'package:provider/provider.dart';

class OnSaleListView extends StatefulWidget {
  const OnSaleListView({
    super.key,
  });

  @override
  State<OnSaleListView> createState() => _OnSaleListViewState();
}

class _OnSaleListViewState extends State<OnSaleListView> {
  @override
  Widget build(BuildContext context) {
    final saleProductProvider = Provider.of<ProductProvider>(context);

    // Get the first three or fewer on-sale products
    final onSaleProducts =
        saleProductProvider.getOnSaleProducts.take(3).toList();

    return SizedBox(
      height: 200, // Adjust height based on your content
      child: onSaleProducts.isEmpty
          ? const Center(
              child: Text(
                'No products on sale!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: onSaleProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChangeNotifierProvider.value(
                    value: onSaleProducts[index],
                    child: const OnSaleWidget(),
                  ),
                );
              },
            ),
    );
  }
}
