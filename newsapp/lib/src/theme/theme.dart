import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.red
  ),
  colorScheme: const ColorScheme.dark(
    primary: Colors.red
  )
);
