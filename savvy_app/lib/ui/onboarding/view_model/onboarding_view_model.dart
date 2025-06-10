import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
