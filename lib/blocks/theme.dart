import 'package:flutter/material.dart';

class ThemeCharger with ChangeNotifier {
  ThemeData _themeData;
  ThemeCharger(this._themeData);
  getTheme() => _themeData;
  setTheme(ThemeData theme){
    this._themeData = theme;
    notifyListeners();
  }
}
