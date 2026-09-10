import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsProvider extends ChangeNotifier {
  // Key สำหรับใช้บันทึกข้อมูลใน SharedPreferences
  static const String keyIsDarkMode = 'is_dark_mode';
  static const String keyFontSize = 'font_size';
  static const String keyFontFamily = 'font_family';

  // ค่าเริ่มต้น (Default)
  bool _isDarkMode = false;
  double _fontSize = 14.0;
  String _fontFamily = 'Roboto';

  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;

  AppSettingsProvider() {
    _loadSettingsFromStorage();
  }

  // อ่านข้อมูลเก่าจาก Shared Storage
  Future<void> _loadSettingsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    
    _isDarkMode = prefs.getBool(keyIsDarkMode) ?? false;
    _fontSize = prefs.getDouble(keyFontSize) ?? 14.0;
    _fontFamily = prefs.getString(keyFontFamily) ?? 'Roboto';
    
    notifyListeners();
  }

  // เปลี่ยนโหมดมืด + บันทึก
  Future<void> toggleDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsDarkMode, value);
  }

  // เปลี่ยนขนาดตัวอักษร + บันทึก
  Future<void> setFontSize(double size) async {
    _fontSize = size;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(keyFontSize, size);
  }

  // เปลี่ยนฟอนต์ + บันทึก
  Future<void> setFontFamily(String family) async {
    _fontFamily = family;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyFontFamily, family);
  }
}