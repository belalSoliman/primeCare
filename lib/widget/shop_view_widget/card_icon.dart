import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: const Icon(Icons.shopping_basket_outlined,
            color: Colors.black, size: 26));
  }
}
