import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const themeState = "THEME_STATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeState, value);
  }

  Future<bool> getDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeState) ?? false;
  }
}
