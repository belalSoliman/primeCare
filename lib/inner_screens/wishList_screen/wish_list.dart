import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/empty_wish_list.dart';
import 'package:pharnacy_trust/inner_screens/wishList_screen/wish_list_item.dart';
import 'package:pharnacy_trust/provider/whist_list_provider.dart';

import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  const WishList({
    super.key,
  });

  static const routeName = '/WishList';

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    final whistListProvider = Provider.of<WhistListProvider>(context);
    final wishList =
        whistListProvider.whistList.values.toList().reversed.toList();

    bool? isempty = whistListProvider.whistList.isEmpty;

    return Scaffold(
        appBar: isempty
            // ignore: dead_code
            ? null
            // ignore: dead_code
            : AppBar(
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                title: const Text(
                                    'Are you sure you want to delete all?'),
                                elevation: 20,
                                actions: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.red),
                                      ))
                                ],
                              ));
                    },
                    icon: const Icon(
                      IconlyLight.delete,
                      color: Colors.red,
                      size: 26,
                    ),
                  ),
                ],
              ),
        body: isempty
            // ignore: dead_code
            ? const EmptyWishlist()
            // ignore: dead_code
            : GridView.builder(
                itemCount: wishList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: wishList[index], child: const WishListItem());
                }));
  }
}
