import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/feed_items.dart';

class GridViewItems extends StatefulWidget {
  const GridViewItems({super.key});

  @override
  State<GridViewItems> createState() => _GridViewItemsState();
}

class _GridViewItemsState extends State<GridViewItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: List.generate(10, (index) {
          return const FeedItems();
        }));
  }
}
