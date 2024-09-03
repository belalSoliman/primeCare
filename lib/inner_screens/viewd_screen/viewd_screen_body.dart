import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pharnacy_trust/inner_screens/viewd_screen/empty_viewd_screen.dart';
import 'package:pharnacy_trust/inner_screens/viewd_screen/viewd_item.dart';

class ViewdScreenBody extends StatelessWidget {
  const ViewdScreenBody({super.key});
  static const routeName = '/ViewdScreenBody';
  @override
  Widget build(BuildContext context) {
    bool isempty = false;
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
                  ]),
        body: isempty
            // ignore: dead_code
            ? const EmptyViewdScreen()
            // ignore: dead_code
            : ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ViewdItem();
                }));
  }
}
