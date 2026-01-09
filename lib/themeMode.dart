import 'package:flutter/material.dart';

class Thememode extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void changetosystemmode() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changetolightmode() {
    _themeIndex = 1;
    notifyListeners();
  }

  void changetodarkmode() {
    _themeIndex = 2;
    notifyListeners();
  }
}
