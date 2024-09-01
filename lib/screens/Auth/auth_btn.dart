import 'package:flutter/material.dart';

class AuthBtn extends StatelessWidget {
  const AuthBtn(
      {super.key,
      required this.fct,
      required this.btnText,
      required this.color});
  final Function fct;
  final String btnText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          fct();
        },
        child: Text(
          btnText,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
      ),
    );
  }
}
