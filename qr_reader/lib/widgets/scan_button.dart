import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

        print(barcodeScanRes);
      },
    );
  }
}