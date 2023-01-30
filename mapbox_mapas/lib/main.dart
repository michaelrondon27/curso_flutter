import 'package:flutter/material.dart';

import 'package:mapbox_mapas/src/screens/full_map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FullMapaScreen(),
      title: 'Material App'
    );
  }
}