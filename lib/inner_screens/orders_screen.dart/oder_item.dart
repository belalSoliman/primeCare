import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.grey[300],
              child: Image.asset("assets/category_assets/cat-2.png"),
            )
          ],
        ));
  }
}
