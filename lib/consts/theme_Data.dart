import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDark, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDark ? const Color(0xff00001a) : const Color(0xffffffff),
      primaryColor: const Color(0xff4157FF),
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xff4157FF),
            secondary:
                isDark ? const Color(0xff0a0d2c) : const Color(0xfff2fdfd),
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDark ? const Color(0xff0a0d2c) : const Color(0xfff2fdfd),
      canvasColor: isDark ? Colors.black : Colors.grey[50],
      buttonTheme: ButtonThemeData(
        colorScheme: isDark
            ? const ColorScheme.dark(
                primary: Color(0xff4157FF),
                secondary: Color(0xff0a0d2c),
              )
            : const ColorScheme.light(
                primary: Color(0xff4157FF),
                secondary: Color(0xfff2fdfd),
              ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDark ? Colors.white : Colors.black,
            displayColor: isDark ? Colors.white : Colors.black,
          ),
      appBarTheme: AppBarTheme(
        color: isDark ? const Color(0xff0a0d2c) : const Color(0xffffffff),
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff4157FF),
          foregroundColor: isDark ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
