import 'package:flutter/material.dart';

import 'package:productos_app/screens/screens.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => HomeScreen(),
        'login': ( _ ) => LoginScreen(),
        'product': ( _ ) => ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
          elevation: 0
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      title: 'Productos App',
    );
  }
}