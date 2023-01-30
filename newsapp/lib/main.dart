import 'package:flutter/material.dart';

import 'package:newsapp/src/screens/tabs_screen.dart';
import 'package:newsapp/src/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
      theme: myTheme,
      title: 'Material App'
    );
  }
}