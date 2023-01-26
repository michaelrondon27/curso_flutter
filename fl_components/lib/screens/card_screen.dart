import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
        children: [
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon( Icons.photo_album_outlined, color: AppTheme.primaryColor),
                  subtitle: Text('Occaecat deserunt voluptate deserunt laborum. Pariatur eu occaecat aliqua culpa exercitation id quis deserunt enim excepteur sunt ipsum officia magna.'),
                  title: Text('Soy un título')
                )
              ]
            )
          )
        ],
      )
    );
  }
}