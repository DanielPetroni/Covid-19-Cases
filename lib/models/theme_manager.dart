import 'package:flutter/cupertino.dart';

class ThemeManager extends ChangeNotifier {
  bool _darkModeEnabled = false;

  bool get darkModeEnabled{
    return _darkModeEnabled;
  }
  setDarkMode(bool value) {
    _darkModeEnabled = value;
    print(_darkModeEnabled);
    notifyListeners();
  }
}
