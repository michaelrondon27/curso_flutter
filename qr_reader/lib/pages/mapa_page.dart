import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_reader/providers/db_provider.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  MapType mapType = MapType.normal;
  
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng() 
    ));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon( Icons.location_disabled ),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;

              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17.5
                  )
                )
              );
            },
          )
        ],
        centerTitle: true,
        title: Text('Mapa')
      ),
      body: GoogleMap(
        initialCameraPosition: puntoInicial,
        mapType: mapType,
        markers: markers,
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.layers ),
        onPressed: () {
          if ( mapType == MapType.normal ) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }

          setState(() {});
        },
      ),
    );
  }
}