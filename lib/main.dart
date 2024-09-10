import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharnacy_trust/pharmacy_entry_point.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only lock orientation on mobile platforms
  if (!kIsWeb) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(const PharmacyEntryPoint()),
    );
  } else {
    runApp(const PharmacyEntryPoint());
  }
}
