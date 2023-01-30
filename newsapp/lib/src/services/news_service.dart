import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/news_models.dart';

class NewsService extends ChangeNotifier {

  final _urlNews = 'newsapi.org';
  final _apikey = '242bb724ce6540aabb80a73c753f2a25';
  final _country = 've';

  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines(); 
  }

  getTopHeadlines() async {
    final url = Uri.https(_urlNews, '/v2/top-headlines', {
      'apiKey': _apikey,
      'country': _country
    });

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

}