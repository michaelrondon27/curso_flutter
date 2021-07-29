import 'package:flutter/material.dart';
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
        return Padding(
          child: Column(
            children: [
              Icon( categories[index].icon ),
              
              SizedBox( height: 5 ),

              Text( categories[index].name )
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
