import 'package:flutter/material.dart';

class AppSettingsProvider with ChangeNotifier {
  
  bool _isDarkMode = false;
  double _fontSize = 14.0; // Small (14px)
  String _fontFamily = 'SansSerif';

  
  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;

  
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners(); // แจ้ง UI ให้วาดใหม่ทันที[cite: 1]
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }

  void setFontFamily(String font) {
    _fontFamily = font;
    notifyListeners();
  }
}