import 'package:flutter/material.dart';

import 'package:disenos/screens/basic_design.dart';
import 'package:disenos/screens/scroll_design.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'scroll_screen',
      routes: {
        'basic_design': ( _ ) => BasicDesingScreen(),
        'scroll_screen': ( _ ) => ScrollScreen()
      },
      title: 'Material App',
    );
  }
}
