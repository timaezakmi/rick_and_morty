import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(color: const Color.fromARGB(255, 199, 221, 238)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color.fromARGB(255, 199, 221, 238),
      ),
      // Добавьте другие стили для светлой темы
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF24282F),
      appBarTheme: AppBarTheme(color: Color(0xFF3C3E44)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),

      // Добавьте другие стили для темной темы
    );
  }
}
