import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Michael';

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = new TextEditingController( text: _nombre );
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
            onChanged: ( value ) {
              setState(() {
                _genero = value as int;
              });
            },
            title: Text('Masculino'),
            value: 1, 
          ),

          RadioListTile(
            groupValue: _genero,
            onChanged: ( value ) {
              setState(() {
                _genero = value as int;
              });
            },
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
