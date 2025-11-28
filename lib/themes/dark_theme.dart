import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xff18181c),
    primary: Colors.grey[900]!,
    tertiary: Colors.grey[100],
    secondary: Colors.grey[800]!,
    inversePrimary: Colors.grey[200]!,
    inverseSurface: Colors.deepPurple[400],
  ),
);
