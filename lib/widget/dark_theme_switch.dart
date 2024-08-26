import 'package:flutter/material.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Center(
      child: Row(
        children: [
          Icon(
            darkThemeProvider.darkTheme ? Icons.dark_mode : Icons.light_mode,
            color: darkThemeProvider.darkTheme ? Colors.white : Colors.black,
          ),
          Switch(
            value: darkThemeProvider.darkTheme,
            onChanged: (value) {
              setState(() {
                darkThemeProvider.darkTheme = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
