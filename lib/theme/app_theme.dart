import 'package:flutter/material.dart';
import 'package:mini_app/theme/app_colors.dart';

// The main theme configuration for the app, defining colors, typography, and component styles to ensure a consistent look and feel across the app.
// It uses Material 3 design principles and customizes the color scheme based on the defined primary and secondary colors.

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: scaffoldColor,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    surface: scaffoldColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  dividerColor: dividerColor,
);
