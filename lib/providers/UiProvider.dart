import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  bool _selectMenuOpt = false;

  bool get selectMenuOpt {
    return _selectMenuOpt;
  }

  set selectMenuOpt(bool value) {
    _selectMenuOpt = value;
    notifyListeners();
  }
}
