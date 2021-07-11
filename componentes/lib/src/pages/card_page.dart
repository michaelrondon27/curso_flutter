import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        children: [
          _cardTipo1()
        ],
        padding: EdgeInsets.all(10),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            subtitle: Text('Aquí estamos con la descripción de la tarjeta que quiero que ustedes vean para tener una idea de lo que quiero mostrarles.'),
            title: Text('Soy el título de esta tarjeta'),
          ),
          Row(
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {}, 
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {}, 
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ]
      ),
    );
  }
}