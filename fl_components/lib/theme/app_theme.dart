import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // AppBar
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0
    ),

    // ElvatedButton
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(primaryColor),
        elevation: MaterialStatePropertyAll<double>(0),
        shape: MaterialStatePropertyAll<OutlinedBorder>(StadiumBorder())
      )
    ),

    // FLoatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 5
    ),

    // InputDEcoration
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

    // PrimaryColor
    primaryColor: primaryColor,

    // TextButton
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