import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _email = '';
  String _fecha = '';
  String _nombre = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

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
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach( (poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon( Icons.select_all ),
        SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
            items: getOpcionesDropdown(),
            onChanged: ( opt ) {
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
            },
            value: _opcionSeleccionada
          ),
        )
      ],
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

  Widget _crearFecha( BuildContext context ) {
    return TextField(
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        icon: Icon( Icons.calendar_today ),
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar )
      ),
      enableInteractiveSelection: false,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate( context );
      },
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
      subtitle: Text('Email: $_email'),
      title: Text('Nombre es: $_nombre'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  _selectDate( BuildContext context ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: new DateTime(2018),
      initialDate: new DateTime.now(),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}