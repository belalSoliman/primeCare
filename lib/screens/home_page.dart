import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: Center(
      child: Switch(
          value: darkThemeProvider.darkTheme,
          onChanged: (value) {
            darkThemeProvider.darkTheme = value;
          }),
    ));
  }
}
