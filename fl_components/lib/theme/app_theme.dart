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
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        ),
        borderSide: BorderSide(color: primaryColor)
      ),
      floatingLabelStyle: TextStyle(color: primaryColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        ),
        borderSide: BorderSide(color: primaryColor)
      )
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