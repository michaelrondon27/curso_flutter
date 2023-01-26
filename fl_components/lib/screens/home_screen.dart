import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOptions.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter')
      ),
      body: ListView.separated(
        itemCount: menuOptions.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(menuOptions[i].icon, color: AppTheme.primaryColor),
          title: Text(menuOptions[i].name),
          onTap: () => Navigator.pushNamed(context, menuOptions[i].route)
        ), 
        separatorBuilder: (_, __) => const Divider() 
      )
    );
  }
}