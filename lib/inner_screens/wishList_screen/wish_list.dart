import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/wish_list_item.dart';

class WishList extends StatefulWidget {
  WishList({
    super.key,
  });

  static const routeName = '/WishList';

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: const BackButton(
            color: Colors.black,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.transparent),
              foregroundColor: WidgetStatePropertyAll(Colors.black),
              shape: WidgetStatePropertyAll(CircleBorder()),
              padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
              elevation: WidgetStatePropertyAll(0),
            ),
          ),
          elevation: 4,
          title: const Text('WishList'),
          actions: [
            IconButton(
              tooltip: 'Delete all',
              onPressed: () {},
              icon: const Icon(
                IconlyLight.delete,
                color: Colors.red,
                size: 26,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const WishListItem();
              }),
        ));
  }
}
