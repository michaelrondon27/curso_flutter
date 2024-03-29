import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:newsapp/src/widgets/list_news.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget> [
            const _CategoryList(),

            Expanded(
              child: ListNews(news: newsService.getArticlesCategorySelected)
            )
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

    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
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
      ),
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

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        width: 40,
        child: Icon(category.icon, color: (newsService.selectedCategory == category.name) ? myTheme.primaryColor : Colors.black54)
      ),
    );
  }
}