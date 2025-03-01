import 'package:quran/core/theme/app_color.dart';
import 'package:quran/core/theme/app_color_scheme.dart';
import 'package:quran/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      textTheme: AppTextStyle.lightTextTheme,
      primaryColor: AppColor.primary,
      colorScheme: ApptColorScheme.light,
      scaffoldBackgroundColor: AppColor.black[50],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        shadowColor: AppColor.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColor.primary,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primaryAccent,
        unselectedItemColor: AppColor.neutral[500],
      ),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      textTheme: AppTextStyle.darkTextTheme,
      primaryColor: AppColor.primary,
      colorScheme: ApptColorScheme.dark,
      scaffoldBackgroundColor: AppColor.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primary,
        surfaceTintColor: AppColor.primary,
        shadowColor: AppColor.primary,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColor.primary,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      useMaterial3: true,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.primary[900],
        selectedItemColor: AppColor.primaryAccent,
        unselectedItemColor: AppColor.neutral[500],
      ),
    );
  }
}
