import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        IconlyLight.heart,
        color: Colors.black,
        size: 26,
      ),
    );
  }
}
