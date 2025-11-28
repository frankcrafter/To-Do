import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey[200]!,
    primary: Colors.grey[300]!,
    secondary: Colors.grey[500]!,
    tertiary: Colors.grey[100]!,
    inversePrimary: Color(0xff18181c),
    inverseSurface: Colors.blueAccent[200]!,
  ),
);
