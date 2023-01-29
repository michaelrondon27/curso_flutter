import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';

class DireccionesScreen extends StatelessWidget {
   
  const DireccionesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final scans = Provider.of<ScanListProvider>(context).scans;

    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
        onTap: () {},
        subtitle: Text(scans[i].id.toString()),
        title: Text(scans[i].valor),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey)
      ),
      itemCount: scans.length
    );
  }
}