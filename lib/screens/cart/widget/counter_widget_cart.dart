import 'package:flutter/material.dart';

class CounterWidgetCart extends StatefulWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterWidgetCart({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<CounterWidgetCart> createState() => _CounterWidgetCartState();
}

class _CounterWidgetCartState extends State<CounterWidgetCart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: widget.onDecrement,
          icon: const Icon(Icons.remove),
          color: Colors.red,
          iconSize: 18,
        ),
        Text(
          '${widget.count}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: widget.onIncrement,
          icon: const Icon(Icons.add),
          color: Colors.blue,
          iconSize: 18,
        ),
      ],
    );
  }
}
