import 'package:flutter/material.dart';

class ShopProductView extends StatelessWidget {
  const ShopProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
