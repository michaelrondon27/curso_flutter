import 'package:flutter/material.dart';

import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

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
        return _News(index: i, news: news[i]);
      },
      itemCount: news.length,
    );
  }
}

class _News extends StatelessWidget {

  final int index;
  final Article news;

  const _News({
    Key? key,
    required this.index,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        _CardTopBar(index: index, news: news),

        _CardTitle(news: news),

        _CardImage(news: news)
      ]
    );
  }

}

class _CardTopBar extends StatelessWidget {

  final int index;
  final Article news;
  
  const _CardTopBar({
    Key? key,
    required this.index,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget> [
          Text('${index + 1}. ', style: TextStyle(color: myTheme.colorScheme.secondary)),
          Text('${news.source.name}. ')
        ]
      )
    );
  }

}

class _CardTitle extends StatelessWidget {

  final Article news;
  
  const _CardTitle({
    Key? key,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(news.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
    );
  }

}

class _CardImage extends StatelessWidget {

  final Article news;
  
  const _CardImage({
    Key? key,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }

}
