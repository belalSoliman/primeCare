import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                counter--;

                if (counter < 0) {
                  counter = 0;
                }
              });
            },
            icon: const Icon(
              IconlyLight.delete,
              color: Colors.red,
              size: 26,
            )),
        Text("$counter"),
        IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: const Icon(
              IconlyLight.plus,
              color: Colors.blue,
              size: 26,
            )),
      ],
    );
  }
}
