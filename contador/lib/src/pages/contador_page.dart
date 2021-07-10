import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = new TextStyle(fontSize: 25);

  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stateful'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Número de taps:', style: _estiloTexto),
            Text('$_conteo', style: _estiloTexto),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ),
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones() {
    return Row(
      children: [
        SizedBox(width: 30),
        FloatingActionButton(
          child: Icon( Icons.exposure_zero ),
          onPressed: () {
            setState(() {
              _conteo++;
            });
          },
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon( Icons.remove ),
          onPressed: () {
            setState(() {
              _conteo--;
            });
          },
        ),
        SizedBox( width: 5.0 ),
        FloatingActionButton(
          child: Icon( Icons.add ),
          onPressed: () {
            setState(() {
              _conteo++;
            });
          },
        )
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
