import 'package:flutter/material.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ( _, i ) => ListTile(
        leading: Icon( Icons.map, color: Theme.of(context).primaryColor ),
        onTap: () => print('abrir algo'),
        subtitle: Text('ID: $i'),
        title: Text('Prueba $i'),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey )
      ),
      itemCount: 10,
    );
  }
}