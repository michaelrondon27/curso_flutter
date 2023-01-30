import 'package:flutter/material.dart';
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
      itemBuilder: (BuildContext context, int i) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(categories[i].icon),
            const SizedBox(height: 5),
            Text(categories[i].name)
          ]
        )
      ),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal
    );
  }
}