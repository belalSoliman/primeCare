import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/consts.dart';

import 'package:pharnacy_trust/widget/category_page_widgets/category_view_body.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Set the crossAxisCount to 2 for phone-sized screens and adjust for larger screens
          int crossAxisCount;
          if (constraints.maxWidth < 600) {
            crossAxisCount = 2; // Always display 2 columns on phones
          } else {
            crossAxisCount = (constraints.maxWidth / 200)
                .floor(); // Adjust for larger screens
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // Adjust as needed to control item shape
            ),
            itemCount: 6, // Example: Number of items
            itemBuilder: (BuildContext context, int index) {
              return CategoryViewItem(
                // Replace with actual image paths
                color: Colors.primaries[index % Colors.primaries.length],
                imageUrl: Constss.categoryList[index]['imageUrl'],
                // Replace with actual image paths
                title: Constss.categoryList[index]['title'],
              );
            },
          );
        },
      ),
    );
  }
}
