import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
   
  const CustomNavigatorBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones'
        )
      ]
    );
  }
}