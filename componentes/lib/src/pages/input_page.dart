import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _email = '';
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
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona()
        ],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      ),
    );
  }

  Widget _crearEmail() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        icon: Icon( Icons.email ),
        labelText: 'Email',
        suffixIcon: Icon( Icons.alternate_email )
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: ( value ) => setState(() {
        _email = value;
      }),
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
      onChanged: ( value ) => setState(() {
        _nombre = value;
      }),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _crearPassword() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        icon: Icon( Icons.lock ),
        labelText: 'Password',
        suffixIcon: Icon( Icons.lock_open )
      ),
      obscureText: true,
      onChanged: ( value ) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }
}