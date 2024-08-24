import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_Data.dart';
import 'package:pharnacy_trust/screens/home_page.dart';

class PharmacyEntryPoint extends StatelessWidget {
  const PharmacyEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'prime Care',
      theme: Styles.themeData(isDark, context),
      home: const HomeScreen(),
    );
  }
}
