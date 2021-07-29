import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/news_models.dart';

final _APIKEY = '242bb724ce6540aabb80a73c753f2a25';

final _URL_NEWS = 'newsapi.org';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsServive() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https('$_URL_NEWS', '/v2/top-headlines', {
      'apiKey': '$_APIKEY',
      'country': 've'
    });

    final resp = await http.get( url );

    final newsResponse = newsResponseFromJson( resp.body );

    this.headlines.addAll( newsResponse.articles );

    notifyListeners();
  }
}