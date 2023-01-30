import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const <Widget> [
            Expanded(child: _CategoryList())
          ]
        )
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  
  const _CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        
        final cName = categories[i].name;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _CategoryButton(category: categories[i]),
              const SizedBox(height: 5),
              Text('${cName[0].toUpperCase()}${cName.substring(1)}')
            ]
          )
        );
      },
      itemCount: categories.length,
      scrollDirection: Axis.horizontal
    );
  }
}

class _CategoryButton extends StatelessWidget {
  
  final CategoryModel category;

  const _CategoryButton({
    Key? key,
    required this.category
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        width: 40,
        child: Icon(category.icon, color: Colors.black54)
      ),
    );
  }
}