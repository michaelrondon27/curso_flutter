import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/menu-img.jpg')
              )
            ),
          ),

          ListTile(
            leading: Icon( Icons.pages, color: Colors.blue ),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
            title: Text('Home'),
          ),

          ListTile(
            leading: Icon( Icons.party_mode, color: Colors.blue ),
            onTap: () {},
            title: Text('Party mode'),
          ),

          ListTile(
            leading: Icon( Icons.people, color: Colors.blue ),
            onTap: () {},
            title: Text('People'),
          ),

          ListTile(
            leading: Icon( Icons.settings, color: Colors.blue ),
            onTap: () => Navigator.pushReplacementNamed(context, SettingsPage.routeName),
            title: Text('Settings'),
          )
        ],
        padding: EdgeInsets.zero
      )
    );
  }
}
