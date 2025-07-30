import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ThemeProvider with ChangeNotifier {
  late bool _isDark;
  late SharedPreferences _prefs;

  bool get isDark => _isDark;
  ThemeData get currentTheme =>
      _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  ThemeProvider() {
    _isDark = false; // Значение по умолчанию
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _isDark = _prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    await _prefs.setBool('isDark', _isDark);
    notifyListeners();
  }
}
