import 'package:flutter/material.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_typography.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.whiteColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.whiteColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    unselectedItemColor: AppColors.oxfordBlueColor,
    selectedItemColor: AppColors.oxfordBlueColor,
  ),
  primaryTextTheme: const TextTheme(
    headline6: AppTypography.text18MediumMartinique,
  ),
  textTheme: const TextTheme(
    headline6: AppTypography.text18MediumMartinique,
    headline3: AppTypography.text32BoldOxfordBlue,
    headline2: AppTypography.text24BoldOxfordBlue,
    subtitle1: AppTypography.text14BoldWhite,
    subtitle2: AppTypography.text16MediumOxfordBlue,
    bodyText1: AppTypography.text14RegularWaterloo,
    caption: AppTypography.text14RegularFruitSalad,
    headline1: AppTypography.text14BoldOxfordBlue,
    bodyText2: AppTypography.text14RegularWaterloo,
    headline4: AppTypography.text16RegularMartinique,
    headline5: AppTypography.text14BoldWaterloo,
  ),
  cardColor: AppColors.wildSandColor,
  hintColor: AppColors.whiteColor,
  disabledColor: AppColors.waterlooColor,
  indicatorColor: AppColors.oxfordBlueColor,
  canvasColor: AppColors.fruitSaladColor,
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.charadeColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.charadeColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.charadeColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    unselectedItemColor: AppColors.whiteColor,
    selectedItemColor: AppColors.whiteColor,
  ),
  textTheme: const TextTheme(
    headline6: AppTypography.text18MediumWhite,
    headline3: AppTypography.text32BoldWhite,
    headline2: AppTypography.text24BoldWhite,
    subtitle1: AppTypography.text14BoldWhite,
    subtitle2: AppTypography.text16MediumWhite,
    bodyText1: AppTypography.text14RegularWaterloo,
    caption: AppTypography.text14RegularFruitSalad,
    headline1: AppTypography.text14BoldWaterloo,
    bodyText2: AppTypography.text14RegularWhite,
    headline4: AppTypography.text16RegularWhite,
    headline5: AppTypography.text14BoldWaterloo,
  ),
  cardColor: AppColors.sharkColor,
  hintColor: AppColors.oxfordBlueColor,
  disabledColor: AppColors.waterlooColor,
  indicatorColor: AppColors.whiteColor,
  canvasColor: AppColors.pastelGreenColor,
);

// final lightTheme = ThemeData.dark();
