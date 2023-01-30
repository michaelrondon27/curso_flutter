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

        _CardImage(news: news),

        _CardBody(news: news),

        const _CardButtons(),

        const SizedBox(height: 10),
        const Divider()
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        child: Container(
          child: (news.urlToImage != null)
            ? FadeInImage(
                image: NetworkImage(news.urlToImage!),
                placeholder: const AssetImage('assets/giphy.gif')
              )
            : const Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }

}

class _CardBody extends StatelessWidget {

  final Article news;
  
  const _CardBody({
    Key? key,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text((news.description != null) ? news.description! : '')
    );
  }

}

class _CardButtons extends StatelessWidget {
  
  const _CardButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget> [
          RawMaterialButton(
            fillColor: myTheme.colorScheme.secondary,
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border)
          ),

          const SizedBox(width: 10),

          RawMaterialButton(
            fillColor: Colors.blue,
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more)
          )
        ]
      )
    );
  }

}
