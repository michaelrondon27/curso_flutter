import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _TempHomeScreen(),
      title: 'Material App',
    );
  }
}

class _TempHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hola mundo'),
        Text('Hola mundo')
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}