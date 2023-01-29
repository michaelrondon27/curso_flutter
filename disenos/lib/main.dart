
import 'package:flutter/material.dart';

import 'package:disenos/screens/basic_design.dart';
import 'package:disenos/screens/scroll_design.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/scroll_design',
      routes: {
        '/basic_design': (_) => const BasicDesignScreen(),
        '/scroll_design': (_) => const ScrollDesignScreen(),
      },
      title: 'Material App'
    );
  }
}

