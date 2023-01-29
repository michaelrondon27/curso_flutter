import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
   
  const CustomNavigatorBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

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
      ],
      onTap: (value) => uiProvider.selectedMenuOpt = value
    );
  }
}