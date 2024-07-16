import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isLightTheme = true;

  void toggleTheme(){
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  void changeTheme(bool value){
    isLightTheme = value;
    notifyListeners();
  }
}