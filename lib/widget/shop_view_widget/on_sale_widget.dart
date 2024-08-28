import 'package:flutter/material.dart';
import 'package:pharnacy_trust/inner_screens/on_sale_screens.dart';
import 'package:pharnacy_trust/service/global_methods.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/card_icon.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/heart_widget.dart';

class OnSaleWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double originalPrice;
  final double salePrice;

  const OnSaleWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.salePrice,
  });

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const HeartWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Text(
                  '\$$salePrice',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$$originalPrice',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                CardIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
