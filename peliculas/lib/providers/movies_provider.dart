import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiUrl = '7a3f4cbe05801e3adbec1ac98275422d';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiUrl,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingRresponse.fromJson( response.body );
    
    this.onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
