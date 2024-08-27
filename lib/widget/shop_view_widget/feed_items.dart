import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/heart_widget.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/item_counter.dart';

class FeedItems extends StatefulWidget {
  const FeedItems({super.key});

  @override
  State<FeedItems> createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey.shade300,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Image.asset(
                "assets/category_assets/cat-6.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    const Text(
                      "Product 1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    const HeartWidget(),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 5,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: const Text(
                      "\$10.00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Spacer(),
                  ItemCounter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
