import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StripePaymentScreen extends StatefulWidget {
  final double totalAmount;
  static const String routeName = '/StripePaymentScreen';
  const StripePaymentScreen({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  _StripePaymentScreenState createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await makePayment();
          },
          child: Text('Pay \$${widget.totalAmount.toStringAsFixed(2)}'),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent(
          widget.totalAmount.toString(), 'USD'); //json response from server

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Pharmacy Trust',
        ),
      );

      // Present the payment sheet
      displayPaymentSheet();
    } catch (e) {
      print('Error: $e');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Payment successful!"),
      ));
      paymentIntentData = null;
    } on StripeException catch (e) {
      print("Error from Stripe: $e");
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Payment Cancelled"),
              ));
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      // Backend API to create PaymentIntent
      final response = await http.post(
        Uri.parse('https://your-backend-server.com/create-payment-intent'),
        body: {
          'amount': calculateAmount(amount),
          'currency': currency,
        },
        headers: {
          'Authorization': 'Bearer your-secret-key',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmount = (double.parse(amount) * 100).toInt();
    return calculatedAmount.toString();
  }
}
