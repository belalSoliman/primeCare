import 'package:flutter/material.dart';

class OnSaleWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double originalPrice;
  final double salePrice;

  const OnSaleWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.salePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '\$$originalPrice',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '\$$salePrice',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
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
