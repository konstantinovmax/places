import 'package:flutter/material.dart';
import 'package:places/theme/app_colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteColor),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: AppColors.whiteColor),
  primaryColor: AppColors.wildSandColor,
);

// final lightTheme = ThemeData.dark();
