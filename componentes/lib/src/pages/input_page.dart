import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona()
        ],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        helperText: 'Sólo es el nombre',
        hintText: 'Nombre de la persona',
        icon: Icon( Icons.account_circle ),
        labelText: 'Nombre',
        suffixIcon: Icon( Icons.accessibility )
      ),
      onChanged: ( value ) {
        setState(() {
          _nombre = value;
        });
      },
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }
}