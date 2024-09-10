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
        backgroundColor: Colors.white, // Set background color for the dialog
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Set rounded corners
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.blueAccent, // Set the color of the title text
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[800], // Set the color of the content text
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  Colors.red, // Set the background color of the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Set rounded corners for the button
              ),
            ),
            child: const Text(
              "Ok",
              style: TextStyle(
                color: Colors.white, // Set the color of the button text
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
