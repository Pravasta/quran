import 'package:flutter/material.dart';

class AppColor {
  static const neutral = MaterialColor(0xff4B5563, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });

  static const accent = MaterialColor(0xFFFFA41B, <int, Color>{
    50: Color(0xFFFFF6E8),
    100: Color(0xFFFFEDD1),
    200: Color(0xFFFFE4BB),
    300: Color(0xFFFFDBA4),
    400: Color(0xFFFFD18D),
    500: Color(0xFFFFC876),
    600: Color(0xFFFFBF5F),
    700: Color(0xFFFFB649),
    800: Color(0xFFFFAD32),
    900: Color(0xFFFFA41B),
  });

  static const black = MaterialColor(0xFF111827, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });

  static const MaterialColor primary = MaterialColor(0xFF6A2FA9, <int, Color>{
    50: Color(0xFFEDE6F5),
    100: Color(0xFFD2C1E5),
    200: Color(0xFFB597D4),
    300: Color(0xFF976DC3),
    400: Color(0xFF804EB6),
    500: Color(0xFF6A2FA9),
    600: Color(0xFF622AA2),
    700: Color(0xFF572398),
    800: Color(0xFF4D1D8F),
    900: Color(0xFF3C127E),
  });

  static const MaterialColor primaryAccent =
      MaterialColor(0xFF6A2FA9, <int, Color>{
        100: Color(0xFFCDB3FF),
        200: Color(0xFF6A2FA9),
        400: Color(0xFF8A4DFF),
        700: Color(0xFF7A33FF),
      });

  static const MaterialColor secondary = MaterialColor(0xFFF9AA68, <int, Color>{
    50: Color(0xFFFEF5ED),
    100: Color(0xFFFDE6D2),
    200: Color(0xFFFCD5B4),
    300: Color(0xFFFBC495),
    400: Color(0xFFFAB77F),
    500: Color(0xFFF9AA68),
    600: Color(0xFFF8A360),
    700: Color(0xFFF79955),
    800: Color(0xFFF6904B),
    900: Color(0xFFF57F3A),
  });

  static const MaterialColor secondaryAccent =
      MaterialColor(0xFFF9AA68, <int, Color>{
        100: Color(0xFFFFFFFF),
        200: Color(0xFFF9AA68),
        400: Color(0xFFFFE6D9),
        700: Color(0xFFFFD6BF),
      });

  static const white = Color(0xFFFFFFFF);
  // static const primaryDark = Color(0xFF00317E);
  static const transparent = Colors.transparent;
}
