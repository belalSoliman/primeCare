import 'package:flutter/material.dart';

class CategoryViewItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color color;

  const CategoryViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff4157FF).withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: screenWidth * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02, // Responsive padding
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Responsive font size
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Image(
              image: AssetImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
