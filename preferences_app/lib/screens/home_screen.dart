import 'package:flutter/material.dart';

import 'package:preferences_app/shared/preferences.dart';
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
        children: [
          Text('isDarkmode: ${Preferences.isDarkmode}'),

          const Divider(),

          Text('Género: ${Preferences.gender}'),

          const Divider(),

          Text('Nombre de usuario: ${Preferences.name}'),

          const Divider()
        ]
      ),
      drawer: const SideMenu()
    );
  }
}