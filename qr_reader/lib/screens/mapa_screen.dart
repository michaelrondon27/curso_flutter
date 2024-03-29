import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_reader/models/scan_model.dart';

class MapaScreen extends StatefulWidget {
   
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();

}

class _MapaScreenState extends State<MapaScreen> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17
    );

    Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng()
    ));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.location_disabled),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: scan.getLatLng(),
                  zoom: 17
                )
              ));
            }
          )
        ],
        title: const Text('Mapa')
      ),
      body: GoogleMap(
        initialCameraPosition: puntoInicial,
        markers: markers,
        mapType: mapType,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () { 
          mapType = (mapType == MapType.normal) ? MapType.satellite : MapType.normal;
          setState(() {});
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

}
