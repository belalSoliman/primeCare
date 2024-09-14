import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pharnacy_trust/pharmacy_entry_point.dart';
import 'package:pharnacy_trust/stripe_payment/stripe_keys.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const PharmacyEntryPoint()),
  );
}
