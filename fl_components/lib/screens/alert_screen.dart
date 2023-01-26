import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        actions: [
          TextButton(
            child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
            onPressed: () => Navigator.pop(context)
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context)
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(height: 10),
            FlutterLogo(size: 100)
          ]
        ),
        title: const Text('Título')
      ),
      context: context
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context)
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context)
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(height: 10),
            FlutterLogo(size: 100)
          ]
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        title: const Text('Título')
      ),
      context: context 
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text('Mostrar Alerta', style: TextStyle(fontSize: 16)),
          ),
          onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogIOS(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context)
      ),
    );
  }
}