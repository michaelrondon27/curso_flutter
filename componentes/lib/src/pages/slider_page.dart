import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Expanded(
              child: _crearImagen()
            )
          ],
        ),
        padding: EdgeInsets.only(top: 50.0),
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
      fit: BoxFit.contain,
      image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG111.png'),
      width: _valorSlider,
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      max: 400.0,
      min: 10.0,
      onChanged: ( value ) {
        setState(() {
          _valorSlider = value;
        });
      },
      value: _valorSlider
    );
  }
}