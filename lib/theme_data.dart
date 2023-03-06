import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    buttonColor: Colors.green.shade300,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    buttonColor: Colors.red.shade300,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  static late SharedPreferences _sharedPreferObject;
  bool _isGreen = true;

  bool get isGreen => _isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSharedPref(_isGreen);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPreferObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPreferObject.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() async {
    //await createSharedPrefObject();
    _isGreen = _sharedPreferObject.getBool('themeData') ?? true;
    /*bi üstteki yorumdakinin kısa hali
        if (_sharedPreferObject.getBool('themeData') == null) {
          _isGreen = true;
        } else {
          _isGreen = _sharedPreferObject.getBool('themeData')!;
        }
      */
  }
}
