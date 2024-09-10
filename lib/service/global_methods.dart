import 'package:flutter/material.dart';

class GlobalMethods {
  navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> errorDialog({
    required BuildContext ctx,
    required String subtitle,
    required String title,
  }) async {
    await showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(
          subtitle,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
