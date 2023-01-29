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
      body: const Center(
         child: Text('HomeScreen'),
      ),
      drawer: const SideMenu()
    );
  }
}