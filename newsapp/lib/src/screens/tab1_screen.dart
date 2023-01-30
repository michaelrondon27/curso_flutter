import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/list_news.dart';

class Tab1Screen extends StatelessWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: ListNews(news: headlines)
    );
  }
}