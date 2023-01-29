import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {

  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int value) {
    _selectedMenuOpt = value;
    notifyListeners();
  }

}