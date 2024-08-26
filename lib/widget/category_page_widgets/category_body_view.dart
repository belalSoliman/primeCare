import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/category_page_widgets/category_item.dart';

class CategoryBodyView extends StatelessWidget {
  const CategoryBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            14,
          ),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(.5),
            width: 1.0,
          )),
      child: const CategoryItem(),
    );
  }
}
