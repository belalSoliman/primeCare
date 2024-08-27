import 'package:flutter/material.dart';
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
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                const CardIcon(),
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
                    fontSize: 20,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
