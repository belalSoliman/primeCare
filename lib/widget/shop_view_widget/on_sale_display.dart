import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/on_sale_widget.dart';

class OnSaleListView extends StatefulWidget {
  final List<Map<String, dynamic>> onSaleItems;

  const OnSaleListView({super.key, required this.onSaleItems});

  @override
  State<OnSaleListView> createState() => _OnSaleListViewState();
}

class _OnSaleListViewState extends State<OnSaleListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height based on your content
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.onSaleItems.length,
        itemBuilder: (context, index) {
          final item = widget.onSaleItems[index];
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
