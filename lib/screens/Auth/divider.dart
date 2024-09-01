import 'package:flutter/material.dart';

class Dividerb extends StatelessWidget {
  const Dividerb({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'OR',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
