import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(primaryColor),
        elevation: MaterialStatePropertyAll<double>(0),
        shape: MaterialStatePropertyAll<OutlinedBorder>(StadiumBorder())
      )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 5
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