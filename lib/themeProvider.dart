import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  set(ThemeData themeData) {
    this._themeData = themeData;
    notifyListeners();
  }

  get() => _themeData;
}

extension lightTheme on ColorScheme {
  Color get backGroundColour => const Color(0xFFFFFFFF);
  Color get bottomClipper => const Color(0xFF21C5DB);
}

// final darkTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF212121),
//   accentColor: Colors.white,
//   accentIconTheme: IconThemeData(color: Colors.black),
//   dividerColor: Colors.black12,
// );

// final lightTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.white,
//   brightness: Brightness.light,
//   backgroundColor: const Color(0xFFE5E5E5),
//   accentColor: Colors.black,
//   accentIconTheme: IconThemeData(color: Colors.white),
//   dividerColor: Colors.white54,
//   errorColor: Colors.red,
//   cardColor: Colors.cyanAccent,
// );
