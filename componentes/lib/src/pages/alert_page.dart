import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlerta( context ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder()
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_location ),
        onPressed: () {
          Navigator.pop( context );
        },
      ),
    );
  }

  void _mostrarAlerta( BuildContext context ) {
    showDialog(
      barrierDismissible: true,
      builder: ( context ) {
        return AlertDialog(
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
          content: Column(
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo( size: 100.0 )
            ],
            mainAxisSize: MainAxisSize.min,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Título'),
        );
      },
      context: context,
    );
  }
}
