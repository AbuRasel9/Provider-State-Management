import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChangeProvider with ChangeNotifier{
  ThemeMode _themeMode=ThemeMode.light;
  ThemeMode get themeMode=>_themeMode;

  setTheme(theme){

    _themeMode=theme;
    print("theme $themeMode");
    notifyListeners();
  }
}