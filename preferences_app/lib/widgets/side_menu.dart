import 'package:flutter/material.dart';

import 'package:preferences_app/screens/screens.dart';

class SideMenu extends StatelessWidget {
   
  const SideMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const _DrawerHeader(),

          ListTile(
            leading: const Icon(Icons.pages_outlined),
            onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.routerName),
            title: const Text('Home')
          ),

          ListTile(
            leading: const Icon(Icons.people_outline),
            onTap: () {},
            title: const Text('People')
          ),

          ListTile(
            leading: const Icon(Icons.settings_outlined),
            onTap: () => Navigator.pushReplacementNamed(context, SettingsScreen.routerName),
            title: const Text('Settings')
          )
        ]
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/menu-img.jpg')
        )
      ),
      child: Container()
    );
  }
}