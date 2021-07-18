import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    final scans = scanListProvider.scans;
    
    return ListView.builder(
      itemBuilder: ( _, i ) => ListTile(
        leading: Icon( Icons.home_outlined, color: Theme.of(context).primaryColor ),
        onTap: () => print('abrir algo'),
        subtitle: Text( scans[i].id.toString() ),
        title: Text( scans[i].valor ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey )
      ),
      itemCount: scans.length,
    );
  }
}