import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;
   
  const ScanTiles({
    Key? key,
    required this.tipo
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scans = Provider.of<ScanListProvider>(context).scans;

    return ListView.builder(
      itemBuilder: (_, i) => Dismissible(
        background: Container(
          color: Colors.red,
        ),
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) => Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id!),
        child: ListTile(
          leading: Icon(
            tipo == 'htpp' ? Icons.map : Icons.home_outlined,
            color: Theme.of(context).primaryColor
          ),
          onTap: () => launchURL(context, scans[i]),
          subtitle: Text(scans[i].id.toString()),
          title: Text(scans[i].valor),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey)
        ),
      ),
      itemCount: scans.length
    );
  }
}