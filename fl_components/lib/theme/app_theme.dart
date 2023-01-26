import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0
    ),
    primaryColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const MaterialStatePropertyAll<Color>(primaryColor),
        overlayColor: MaterialStatePropertyAll<Color>(primaryColor.withOpacity(0.1))
      )
    )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0
    ),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black
  );

}