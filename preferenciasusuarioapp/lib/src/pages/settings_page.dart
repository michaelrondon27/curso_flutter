import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  late int _genero;
  String _nombre = 'Michael';

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    cargarPrefs();

    _textController = new TextEditingController( text: _nombre );
  }

  cargarPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _genero = prefs.getInt('genero') ?? 1;

    setState(() {});
  }

  _setSelectedRadio( int? value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _genero = value ?? 1;

    prefs.setInt('genero', _genero);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajustes'),
      ),
      body: ListView(
        children: [
          Container(
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(5.0),
          ),

          Divider(),

          SwitchListTile(
            onChanged: ( value ) {
              setState(() {
                _colorSecundario = value;
              });
            },
            title: Text('Color secundario'),
            value: _colorSecundario,
          ),

          RadioListTile(
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Masculino'),
            value: 1, 
          ),

          RadioListTile(
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Femenino'),
            value: 2,
          ),

          Divider(),

          Container(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                helperText: 'Nombre de la persona usando el teléfono',
                labelText: 'Nombre'
              ),
              onChanged: ( value ) {},
            ),
            padding: EdgeInsets.symmetric( horizontal: 20.0 ),
          )
        ],
      ),
      drawer: MenuWidget()
    );
  }
}
