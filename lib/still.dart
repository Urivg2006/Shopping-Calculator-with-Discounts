import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
  ),
  scaffoldBackgroundColor: Colors.grey[200],
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
