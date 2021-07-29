import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Text( this.noticias[index].title );
      },
      itemCount: this.noticias.length,
    );
  }
}