import 'package:flutter/material.dart';
import 'package:pharnacy_trust/screens/cart/widget/payment_summery.dart';

class PaymentBtn extends StatelessWidget {
  const PaymentBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive padding, font size, and border radius
    final double horizontalPadding = screenWidth * 0.1;
    final double verticalPadding = 15.0;
    final double fontSize =
        screenWidth * 0.045; // Adjust font size based on screen width
    final double borderRadius =
        screenWidth * 0.05; // Adjust border radius based on screen width

    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) => const Wrap(
              children: [
                PaymentSummary(),
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(screenWidth * 0.8,
              48), // Set button width relative to screen width
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
        ),
        child: Text(
          'Pay Now',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
