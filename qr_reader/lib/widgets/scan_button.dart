import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.filter_center_focus ),
      elevation: 0,
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //   '#3D8BEF', 
        //   'Cancelar', 
        //   false, 
        //   ScanMode.QR
        // );

        final barcodeScanRes = 'https://www.instagram.com/mikerondon27/';

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.nuevoScan( barcodeScanRes );
        scanListProvider.nuevoScan( 'geo:40.4676476,-3.6936124' );
      },
    );
  }
}