import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/shop_product_view.dart';
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
        const Row(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Row(
                children: [
                  Text("On Sale",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.red)),
                  Icon(Icons.discount_outlined, color: Colors.red),
                ],
              ),
            ),
            Flexible(
              child: const OnSaleListView(
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
            ),
          ],
        ),
        const SizedBox(height: 10),
        const ShopProductView(),
      ],
    );
  }
}
