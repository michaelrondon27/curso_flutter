import 'package:flutter/material.dart';

import 'package:qr_reader/screens/home_screen.dart';
import 'package:qr_reader/screens/mapa_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/mapa': (_) => const MapaScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      title: 'QR Reader'
    );
  }
}