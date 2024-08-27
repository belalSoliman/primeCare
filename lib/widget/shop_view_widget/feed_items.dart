import 'package:flutter/material.dart';

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
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(children: [
            Image.asset(
              "assets/category_assets/cat-6.png",
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * .2,
            ),
          ]),
        ));
  }
}
