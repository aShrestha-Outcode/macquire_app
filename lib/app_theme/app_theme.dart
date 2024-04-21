import 'package:flutter/material.dart';
import 'package:macquire_app/app_theme/app_theme_manager.dart';
import 'package:macquire_app/app_theme/app_theme_type.dart';
import 'package:macquire_app/constants/color_constants.dart';

class AppTheme {
  ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.primaryBackgroundDark,
      colorScheme:
          const ColorScheme.dark(secondary: AppColors.primaryTextDark));

  ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primaryBackgroundLight,
      colorScheme:
          const ColorScheme.light(secondary: AppColors.primaryTextLight));

  ThemeData getCurrentTheme(BuildContext context) {
    // what theme do we return?
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    if (AppThemeManager().currentAppTheme == AppThemeType.defaultTheme) {
      return platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
    return AppThemeManager().currentAppTheme == AppThemeType.dark
        ? darkTheme
        : lightTheme;
  }
}
