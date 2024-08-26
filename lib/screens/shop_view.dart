import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/swiper_view.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SwiperView(),
    );
  }
}
