import 'dart:async';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  bool _isLoading = false;
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: ( BuildContext context, int index ) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$imagen/400/300'),
            placeholder: AssetImage('assets/jar-loading.gif')
          );
        },
        itemCount: _listaNumeros.length
      ),
      onRefresh: obtenerPagina1
    );
  }

  Future obtenerPagina1() async {
    final duration = new Duration( seconds: 2 );

    new Timer( duration, () {
      _listaNumeros.clear();

      _ultimoItem++;

      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for ( var i = 1; i < 10; i++ ) {
      _ultimoItem++;
         
      _listaNumeros.add( _ultimoItem );
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds:  2 );

    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250 ) 
    );

    _agregar10();
  }

  Widget _crearLoading() {
    if ( _isLoading ) {
      return Column(
        children: <Widget>[
          Row(
            children: [
              CircularProgressIndicator(),
            ],
            mainAxisAlignment: MainAxisAlignment.center
          ),
          SizedBox(height: 15.0)
        ],
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
      );
    } else {
      return Container();
    }
  }
}
