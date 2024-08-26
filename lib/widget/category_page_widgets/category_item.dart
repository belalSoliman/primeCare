import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize
          .min, // Ensure the column only takes up as much space as needed
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/category assets/sushi (1).png",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Text(
          "Sushi",
          style: TextStyle(
            fontSize: 16, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Optional: Make the text bold
          ),
        ),
      ],
    );
  }
}
