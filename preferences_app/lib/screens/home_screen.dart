import 'package:flutter/material.dart';

import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = '/home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('isDarkmode: '),

          Divider(),

          Text('Género: '),

          Divider(),

          Text('Nombre de usuario: '),

          Divider()
        ]
      ),
      drawer: const SideMenu()
    );
  }
}