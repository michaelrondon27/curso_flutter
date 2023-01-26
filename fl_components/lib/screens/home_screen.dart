import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOptions.toList();
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Componentes en Flutter')
      ),
      body: ListView.separated(
        itemCount: menuOptions.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(menuOptions[i].icon, color: Colors.indigo),
          title: Text(menuOptions[i].name),
          onTap: () => Navigator.pushNamed(context, menuOptions[i].route)
        ), 
        separatorBuilder: (_, __) => const Divider() 
      )
    );
  }
}