import 'package:flutter/material.dart';
import 'package:pharnacy_trust/widget/shop_view_widget/heart_widget.dart';

class FeedItems extends StatefulWidget {
  const FeedItems({super.key});

  @override
  State<FeedItems> createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade300,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Column(children: [
              Image.asset(
                "assets/category_assets/cat-6.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Product 1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: HeartWidget(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Flexible(
                  child: Row(
                    children: [
                      Text(
                        "\$10.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
