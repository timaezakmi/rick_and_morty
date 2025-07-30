import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class BottomNavBarProvider extends ValueNotifier<int> {
  BottomNavBarProvider() : super(0); // Initial value

  void updateScreenIndex(int newIndex) {
    value = newIndex; // Update the value, which triggers listeners
    notifyListeners();
  }
}
