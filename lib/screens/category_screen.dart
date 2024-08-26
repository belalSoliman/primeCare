import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/category_page_widgets/category_view_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
              childAspectRatio: 0.75, // Adjust as needed to control item shape
            ),
            itemCount: 10, // Example: Number of items
            itemBuilder: (BuildContext context, int index) {
              return const CategoryViewItem(
                imageUrl:
                    'assets/category assets/sushi (1).png', // Replace with actual image paths
                title: 'Category Title ',
                subtitle: 'Category Subtitle ',
              );
            },
          );
        },
      ),
    );
  }
}
