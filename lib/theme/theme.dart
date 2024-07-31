import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9F7BF6), // Primary color
      brightness: Brightness.light,
      primary: const Color(0xFF9F7BF6),  // Primary color
      secondary: const Color(0xFF4CE8B8),  // Secondary color
    ),
    useMaterial3: true,
    // Add this to style the text of the ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
    ),
  );
}