import 'package:flutter/material.dart';
abstract class Appcolors {
  static const secondary = Color(0xffFF8FA6);
  static const accent = Color(0xff86F0EA);
  static const textDark = Color(0xFF9899A5);
  static const textLight = Color(0xFFF9FAFE);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = Appcolors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = Appcolors.cardDark;
}

abstract class AppTheme{
  static const accentColor = Appcolors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    visualDensity: visualDensity,
    fontFamily: 'notosans',
    textTheme: const TextTheme().apply(bodyColor: Appcolors.textDark),
    scaffoldBackgroundColor: _LightColors.background,
    cardColor: _LightColors.card,
    primaryTextTheme: const TextTheme(titleLarge: TextStyle(color: Appcolors.textDark)),
    iconTheme: const IconThemeData(color: Appcolors.iconDark)
  );

  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    visualDensity: visualDensity,
    fontFamily: 'notosans',
    textTheme: const TextTheme().apply(bodyColor: Appcolors.textLight),
    scaffoldBackgroundColor: _DarkColors.background,
    cardColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(titleLarge: TextStyle(color: Appcolors.textLight)),
    iconTheme: const IconThemeData(color: Appcolors.iconLight)
  );
}