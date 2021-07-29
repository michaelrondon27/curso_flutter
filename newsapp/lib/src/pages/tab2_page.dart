import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _ListaCategorias()
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

    return ListView.builder(
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
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryModel category;

  const _CategoryButton( this.category );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Icon( category.icon, color: Colors.black54 ),
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
