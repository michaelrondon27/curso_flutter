import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsService extends ChangeNotifier {

  final _urlNews = 'newsapi.org';
  final _apikey = '242bb724ce6540aabb80a73c753f2a25';
  final _country = 've';

  String _selectedCategory = 'business';

  List<Article> headlines = [];
  List<CategoryModel> categories = [
    CategoryModel(FontAwesomeIcons.building, 'business'),
    CategoryModel(FontAwesomeIcons.tv, 'entertainment'),
    CategoryModel(FontAwesomeIcons.addressCard, 'general'),
    CategoryModel(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryModel(FontAwesomeIcons.vials, 'science'),
    CategoryModel(FontAwesomeIcons.volleyball, 'sports'),
    CategoryModel(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> categoryArticles = {}; 

  NewsService() {
    getTopHeadlines();

    categories.forEach((category) {
      categoryArticles[category.name] = [];
    });

    getArticlesByCategory(selectedCategory);
  }

  String get selectedCategory => _selectedCategory; 
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesCategorySelected => categoryArticles[selectedCategory]!; 

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

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) return categoryArticles[category];

    final url = Uri.https(_urlNews, '/v2/top-headlines', {
      'apiKey': _apikey,
      'country': _country,
      'category': category
    });

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }

}