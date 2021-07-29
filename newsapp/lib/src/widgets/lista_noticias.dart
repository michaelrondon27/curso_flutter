import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _Noticia( noticia: this.noticias[index], index: index );
      },
      itemCount: this.noticias.length,
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({
    required this.noticia,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar( noticia, index ),

        _TarjetaTitulo( noticia ),

        _TarjetaImagen( noticia ),

        _TarjetaBody( noticia ),

        _TarjetaBotones(),

        SizedBox( height: 10 ),

        Divider()
      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody( this.noticia );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text( (noticia.description != null) ? noticia.description! : '' ),
      padding: EdgeInsets.symmetric( horizontal: 20 )
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RawMaterialButton(
            child: Icon( Icons.star_border ),
            fillColor: miTema.accentColor,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 20 )
            ),
          ),

          SizedBox( width: 10 ),

          RawMaterialButton(
            child: Icon( Icons.more ),
            fillColor: Colors.blue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular( 20 )
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen( this.noticia );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only( bottomRight: Radius.circular( 50 ), topLeft: Radius.circular( 50 ) ),
        child: Container(
          child: ( noticia.urlToImage != null ) 
          ? FadeInImage(
              image: NetworkImage( noticia.urlToImage! ),
              placeholder: AssetImage('assets/img/giphy.gif'),
            )
          : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
      margin: EdgeInsets.symmetric( vertical: 10 ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo( this.noticia );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        noticia.title,
        style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700 )
      ),
      padding: EdgeInsets.symmetric( horizontal: 15 )
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  
  const _TarjetaTopBar( this.noticia, this.index );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            '${ index + 1 }. ',
            style: TextStyle( color: miTema.accentColor )
          ),

          Text('${ noticia.source.name }. ')
        ]
      ),
      margin: EdgeInsets.only( bottom: 10 ),
      padding: EdgeInsets.symmetric( horizontal: 10 )
    );
  }
}
