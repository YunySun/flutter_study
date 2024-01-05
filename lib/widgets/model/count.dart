import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  double _count = 0;
  double get count => _count;

  void increament() {
    _count += 0.1;
    notifyListeners();
  }
}
