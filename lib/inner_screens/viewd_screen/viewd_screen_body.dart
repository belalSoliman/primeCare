import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/inner_screens/viewd_screen/empty_viewd_screen.dart';
import 'package:pharnacy_trust/inner_screens/viewd_screen/viewd_item.dart';
import 'package:pharnacy_trust/provider/view_product.dart';

import 'package:provider/provider.dart';

class ViewdScreenBody extends StatelessWidget {
  const ViewdScreenBody({super.key});
  static const routeName = '/ViewdScreenBody';
  @override
  Widget build(BuildContext context) {
    final viewdList = Provider.of<ViewProduct1>(context);
    final viewd = viewdList.viewProduct1.values.toList().reversed.toList();
    bool isempty = viewd.isEmpty;
    return Scaffold(
        appBar: isempty
            // ignore: dead_code
            ? null
            // ignore: dead_code
            : AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'Viewed Items',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
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
                                      onPressed: () {
                                        viewdList.clearViewProduct1();
                                        Navigator.pop(context);
                                      },
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
                      icon: Icon(
                        IconlyLight.delete,
                        color: Colors.red,
                        size: 26,
                      ),
                    ),
                  ]),
        body: isempty
            // ignore: dead_code
            ? EmptyViewdScreen()
            // ignore: dead_code
            : ListView.builder(
                itemCount: viewd.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: viewd[index], child: const ViewdItem());
                }));
  }
}
