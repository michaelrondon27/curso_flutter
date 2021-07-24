import 'package:flutter/material.dart';

import 'package:productos_app/screens/screens.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'home' : ( _ ) => HomeScreen(),
        'login': ( _ ) => LoginScreen()
      },
      title: 'Productos App',
    );
  }
}