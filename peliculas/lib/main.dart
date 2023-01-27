import 'package:flutter/material.dart';

import 'package:peliculas/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: '/home',
      routes: {
        '/details': (_) => const DetailsScreen(),
        '/home': (_) => const HomeScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const  AppBarTheme(
          centerTitle: true,
          color: Colors.indigo,
          elevation: 0
        )
      )
    );
  }
}