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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              color: Color(0xffDFE3FF),
            ),
            child: IconButton(
              onPressed: widget.onDecrement,
              icon: const Icon(Icons.remove),
              color: Colors.blue,
              iconSize: 18,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '${widget.count}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 2,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              color: Color(0xffA0ABFF),
            ),
            child: IconButton(
              onPressed: widget.onIncrement,
              icon: const Icon(Icons.add),
              color: Colors.white,
              iconSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
