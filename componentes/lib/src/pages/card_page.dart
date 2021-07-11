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
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
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

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: [
          FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
            height: 300.0,
            image: NetworkImage('https://grupoacerta.com/wp-content/uploads/2019/07/madrid-landscape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif')
          ),
          // Image(
          //   image: NetworkImage('https://grupoacerta.com/wp-content/uploads/2019/07/madrid-landscape.jpg'),
          // ),
          Container(
            child: Text('No tengo idea de que poner'),
            padding: EdgeInsets.all(10.0),
          )
        ]
      )
    );
  }
}