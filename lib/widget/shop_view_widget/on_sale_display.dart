import 'package:flutter/material.dart';
import 'package:pharnacy_trust/models/product_model.dart';
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
    final salePorductProvider = Provider.of<ProductProvider>(context);
    // List<ProductModel> firstThreeItems =
    //     salePorductProvider.getOnSaleProducts.take(3).toList();
    return SizedBox(
      height: 200, // Adjust height based on your content
      child: salePorductProvider.getOnSaleProducts.isEmpty
          ? const SizedBox()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: salePorductProvider.getOnSaleProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChangeNotifierProvider.value(
                    value: salePorductProvider.getOnSaleProducts[index],
                    child: const OnSaleWidget(),
                  ),
                );
              },
            ),
    );
  }
}
