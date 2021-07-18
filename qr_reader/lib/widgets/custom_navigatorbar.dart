import 'package:flutter/material.dart';

class CustomNAvigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex = 1;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon( Icons.map ),
          label: 'Mapa'
        ),

        BottomNavigationBarItem(
          icon: Icon( Icons.compass_calibration ),
          label: 'Direcciones'
        )
      ]
    );
  }
}