import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),

            Expanded(
              child: ListaNoticias( newsService.getArticulosCategoriaSeleccionada ),
            )
          ]
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      child: ListView.builder(
        itemBuilder: ( BuildContext context, int index ) {
          final cName = categories[index].name;

          return Padding(
            child: Column(
              children: [
                _CategoryButton( categories[index] ),
                
                SizedBox( height: 5 ),

                Text( '${ cName[0].toUpperCase() }${ cName.substring(1) }' )
              ]
            ),
            padding: EdgeInsets.all( 8 )
          );
        },
        itemCount: categories.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
      height: 80,
      width: double.infinity,
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryModel category;

  const _CategoryButton( this.category );

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);

    return GestureDetector(
      child: Container(
        child: Icon(
          category.icon,
          color: ( newsService.selectedcategory == category.name ) ? miTema.accentColor : Colors.black54
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        height: 40,
        margin: EdgeInsets.symmetric( horizontal: 10 ),
        width: 40
      ),
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);

        newsService.selectedCategory = category.name;
      },
    );
  }
}
