import 'package:flutter/material.dart';

ThemeData mainLightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.indigo,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
);
