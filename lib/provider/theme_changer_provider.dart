import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChangeProvider with ChangeNotifier{
  ThemeMode _themeMode=ThemeMode.light;

  ThemeMode get themeMode=>_themeMode;

  themeChange({required bool mode}){
    if(mode==true){
      _themeMode=ThemeMode.light;

    }else{
      _themeMode=ThemeMode.dark;
    }
    notifyListeners();
  }
}