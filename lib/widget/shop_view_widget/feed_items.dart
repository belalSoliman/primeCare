import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/custom_btn.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/heart_widget.dart';

class FeedItems extends StatefulWidget {
  const FeedItems({super.key});

  @override
  State<FeedItems> createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using Stack to overlay title and price on the image
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  // The main image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/category_assets/cat-6.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // A gradient overlay for better text visibility
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  // The title and heart icon
                  const Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "\$10.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ]),
                        Spacer(),
                        CustomBtn(),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 7,
                    child: HeartWidget(),
                  ),
                  // The price
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
