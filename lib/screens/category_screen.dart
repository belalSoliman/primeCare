import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/category_page_widgets/category_body_view.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the number of columns based on screen width
        int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1, // Adjust as needed to control item shape
          ),
          itemCount: 10, // Example: Number of items
          itemBuilder: (BuildContext context, int index) {
            return const CategoryBodyView();
          },
        );
      },
    );
  }
}
