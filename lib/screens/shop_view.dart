import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/swiper_view.dart';

import '../widget/shop_view_widget/on_sale_display.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const SwiperView(),
        ),
        Text(
          "On Sale ",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const OnSaleListView(
          onSaleItems: [
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
              'title': 'Product 1',
              'originalPrice': 99.99,
              'salePrice': 79.99,
            },
            {
              'imageUrl': 'assets/category_assets/cat-1.png',
              'title': 'Product 1',
              'originalPrice': 99.99,
              'salePrice': 79.99,
            },
            {
              'imageUrl': 'assets/category_assets/cat-1.png',
              'title': 'Product 1',
              'originalPrice': 99.99,
              'salePrice': 79.99,
            },
          ],
        ),
      ],
    );
  }
}
