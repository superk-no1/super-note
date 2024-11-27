import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentColor,
      ),
    );
  }
}
