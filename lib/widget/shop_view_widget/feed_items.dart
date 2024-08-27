import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/custom_btn.dart';
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
            // Using Stack to overlay title and price on the image
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  // The main image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/category_assets/cat-6.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // A gradient overlay for better text visibility
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // The title and heart icon
                  const Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Row(
                      children: [
                        const Text(
                          "Product 1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        const HeartWidget(),
                      ],
                    ),
                  ),
                  // The price
                  const Positioned(
                    top: 0,
                    left: 5,
                    child: const Text(
                      "\$10.00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // The item counter
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  alignment: Alignment.center,
                  child: CustomBtn(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
