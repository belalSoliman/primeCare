import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharnacy_trust/pharmacy_entry_point.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(PharmacyEntryPoint()),
  );
}
