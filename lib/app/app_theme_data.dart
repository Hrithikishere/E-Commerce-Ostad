import 'package:e_commerce_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData{

    static ThemeData get lightThemeData{
      return ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
      );
    }

    static ThemeData get darkThemeData{
      return ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.black87,
        brightness: Brightness.dark,
      );
    }
}