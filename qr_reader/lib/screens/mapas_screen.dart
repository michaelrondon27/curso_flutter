import 'package:flutter/material.dart';

class MapasScreen extends StatelessWidget {
   
  const MapasScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        onTap: () {},
        subtitle: const Text('ID: 1'),
        title: const Text('valor'),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey)
      ),
      itemCount: 10
    );
  }
}