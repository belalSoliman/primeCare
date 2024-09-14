import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'stripe_keys.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      final clientSecret = await _getClientSecret(amount.toString(), currency);

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Primecare", // Customize this for your app
        ),
      );

      // Present the payment sheet
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      // Handle error
      throw Exception("Payment initialization failed: $e");
    }
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    final dio = Dio();
    final response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );

    if (response.statusCode == 200) {
      return response.data["client_secret"];
    } else {
      throw Exception(
          'Failed to create payment intent. Status code: ${response.statusCode}');
    }
  }
}
