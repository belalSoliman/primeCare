import 'package:flutter/material.dart';

class Googlebtn extends StatelessWidget {
  const Googlebtn({super.key, required this.press, required this.icon});
  final VoidCallback press;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
