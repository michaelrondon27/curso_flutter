import 'package:flutter/material.dart';

import 'package:preferences_app/shared/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = '/settings';
   
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings')
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ajustes',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w300
              )
            ),

            const Divider(),

            SwitchListTile.adaptive(
              onChanged: (value) => setState(() => Preferences.isDarkmode = value),
              title: const Text('Darkmode'),
              value: Preferences.isDarkmode
            ),

            const Divider(),

            RadioListTile<int>(
              groupValue: Preferences.gender,
              onChanged: (value) => setState(() => Preferences.gender = value ?? 1),
              title: const Text('Masculino'),
              value: 1
            ),

            const Divider(),

            RadioListTile<int>(
              groupValue: Preferences.gender,
              onChanged: (value) => setState(() => Preferences.gender = value ?? 2),
              title: const Text('Femenino'),
              value: 2
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  helperText: 'Nombre del usuario',
                  labelText: 'Nombre'
                ),
                initialValue: Preferences.name,
                onChanged: (value) => setState(() => Preferences.name = value),
              ),
            )
          ],
        ),
      ),
      drawer: const SideMenu()
    );
  }

}
