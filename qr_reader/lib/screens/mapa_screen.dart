import 'package:flutter/material.dart';

import 'package:qr_reader/models/scan_model.dart';

class MapaScreen extends StatelessWidget {
   
  const MapaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa')
      ),
      body: const Center(
         child: Text('MapaScreen'),
      ),
    );
  }
}