import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Componentes en Flutter')
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.access_time_outlined),
          title: const Text('Nombre de ruta'),
          onTap: () {
            Navigator.pushNamed(context, '/card');
          }
        ), 
        separatorBuilder: (_, __) => const Divider() 
      )
    );
  }
}