import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/on_sale_screens.dart';
import 'package:pharnacy_trust/service/global_methods.dart';

import 'package:pharnacy_trust/widget/shop_view_widget/grid_view_items.dart';

import 'package:pharnacy_trust/widget/shop_view_widget/shop_product_view.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/swiper_view.dart';

import '../widget/shop_view_widget/on_sale_display.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});
  static const routeName = '/ShopView';

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final GlobalMethods globalMethods = GlobalMethods();
  @override
  Widget build(BuildContext context) {
    bool? isOnSale = true;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SwiperView(),
            const SizedBox(height: 10),
            isOnSale
                // ignore: dead_code
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          globalMethods.navigateTo(
                              ctx: context, routeName: OnSaleScreens.routeName);
                        },
                        child: Text(
                          "view all",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            isOnSale
                // ignore: dead_code
                ? const Row(
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
                        child: OnSaleListView(
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
                  )
                : const SizedBox.shrink(),
            const ShopProductView(),
            const SizedBox(
              height: 10,
            ),
            const GridViewItems(),
          ],
        ),
      ),
    );
  }
}
