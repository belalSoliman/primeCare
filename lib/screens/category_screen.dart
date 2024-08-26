import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/category_page_widgets/category_view_body.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  List<Map<String, dynamic>> categoryList = [
    {
      "imageUrl": "assets/category_assets/cat-1.png",
      "title": "Category Title 1",
      "color": Colors.blue,
    },
    {
      "imageUrl": "assets/category_assets/cat-2.png",
      "title": "Category Title 2",
      "color": Colors.red,
    },
    {
      "imageUrl": "assets/category_assets/cat-3.png",
      "title": "Category Title 3",
      "color": Colors.green,
    },
    {
      "imageUrl": "assets/category_assets/cat-4.png",
      "title": "Category Title 4",
      "color": Colors.purple,
    },
    {
      "imageUrl": "assets/category_assets/cat-5.png",
      "title": "Category Title 5",
      "color": Colors.orange,
    },
    {
      "imageUrl": "assets/category_assets/cat-6.png",
      "title": "Category Title 6",
      "color": Colors.pink,
    },
  ];

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
                imageUrl: categoryList[index]['imageUrl'],
                // Replace with actual image paths
                title: categoryList[index]['title'],
              );
            },
          );
        },
      ),
    );
  }
}
