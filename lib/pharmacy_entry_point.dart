import 'package:flutter/material.dart';
import 'package:pharnacy_trust/consts/theme_Data.dart';
import 'package:pharnacy_trust/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/btn_nav_bar.dart';

class PharmacyEntryPoint extends StatefulWidget {
  const PharmacyEntryPoint({super.key});

  @override
  State<PharmacyEntryPoint> createState() => _PharmacyEntryPointState();
}

class _PharmacyEntryPointState extends State<PharmacyEntryPoint> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_) {
        return darkThemeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Prime Care',
            theme: Styles.themeData(darkThemeProvider.darkTheme, context),
            home: const BtnNavBar(),
          );
        },
      ),
    );
  }
}
