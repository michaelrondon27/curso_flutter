import 'package:flutter/material.dart';

import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;

  late TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    _colorSecundario = prefs.colorSecundario;
    _genero = prefs.genero;

    _textController = new TextEditingController( text: prefs.nombreUsuario );
  }

  _setSelectedRadio( int? value ) {
    prefs.genero = value!;

    _genero = value;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ( prefs.colorSecundario ) ? Colors.teal : Colors.blue,
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

                prefs.colorSecundario = value;
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
              onChanged: ( value ) {
                prefs.nombreUsuario = value;
              },
            ),
            padding: EdgeInsets.symmetric( horizontal: 20.0 ),
          )
        ],
      ),
      drawer: MenuWidget()
    );
  }
}
