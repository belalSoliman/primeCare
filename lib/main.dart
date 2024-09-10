import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharnacy_trust/pharmacy_entry_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode on all platforms
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const PharmacyEntryPoint()),
  );
}
