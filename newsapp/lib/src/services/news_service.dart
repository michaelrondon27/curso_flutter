import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

final _APIKEY = '242bb724ce6540aabb80a73c753f2a25';

final _URL_NEWS = 'newsapi.org';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<CategoryModel> categories = [
    CategoryModel( FontAwesomeIcons.building, 'business' ),
    CategoryModel( FontAwesomeIcons.tv, 'entertainment' ),
    CategoryModel( FontAwesomeIcons.addressCard, 'general' ),
    CategoryModel( FontAwesomeIcons.headSideVirus, 'health' ),
    CategoryModel( FontAwesomeIcons.vials, 'science' ),
    CategoryModel( FontAwesomeIcons.volleyballBall, 'sports' ),
    CategoryModel( FontAwesomeIcons.memory, 'technology' ),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();

    categories.forEach( (item) {
      this.categoryArticles[item.name] = [];
    });
  }

  String get selectedcategory => this._selectedCategory;

  set selectedCategory( String value ) {
    this._selectedCategory = value;

    this.getArticlesByCategory( value );

    notifyListeners();
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

  getArticlesByCategory( String category ) async {
    if ( this.categoryArticles[category]!.length > 0 ) {
      return this.categoryArticles[category];
    }

    final url = Uri.https('$_URL_NEWS', '/v2/top-headlines', {
      'apiKey': '$_APIKEY',
      'category': category,
      'country': 've'
    });

    final resp = await http.get( url );

    final newsResponse = newsResponseFromJson( resp.body );

    this.categoryArticles[category]!.addAll( newsResponse.articles );

    notifyListeners();
  }
}