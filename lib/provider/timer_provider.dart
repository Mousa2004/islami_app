import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int count = 0;
  setCount(int apiCount) {
    count = apiCount;
  }

  void decrement() {
    if (count > 0) {
      count--;
      notifyListeners();
    }
  }
}
