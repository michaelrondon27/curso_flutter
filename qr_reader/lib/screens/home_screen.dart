import 'package:flutter/material.dart';
import 'package:qr_reader/screens/direcciones_screen.dart';
import 'package:qr_reader/screens/mapas_screen.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
        elevation: 0,
        title: const Text('Historial')
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}

class _HomeScreenBody extends StatelessWidget {
  
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;

    switch (currentIndex) {
      case 0:
        return const MapasScreen();

      case 1:
        return const DireccionesScreen();

      default:
        return const MapasScreen();
    }
  }
}