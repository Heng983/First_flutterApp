import 'package:flutter/material.dart';

class FontsizeLogic extends ChangeNotifier {
  double _size = 18;
  double get size => _size;

  void increase() {
    if (_size < 25) {
      _size += 3;
      notifyListeners();
    }
  }

  void decrease() {
    if (_size >= 12) {
      _size -= 3;
      notifyListeners();
    }
  }
}
