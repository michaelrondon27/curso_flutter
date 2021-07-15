import 'package:flutter/material.dart';

import 'package:disenos/screens/basic_design.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'basic_design',
      routes: {
        'basic_design': ( _ ) => BasicDesingScreen()
      },
      title: 'Material App',
    );
  }
}
