import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';

class ListNews extends StatelessWidget {

  final List<Article> news;
   
  const ListNews({
    Key? key,
    required this.news
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        return Text(news[i].title);
      },
      itemCount: news.length,
    );
  }
}