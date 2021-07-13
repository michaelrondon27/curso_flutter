import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiUrl = '7a3f4cbe05801e3adbec1ac98275422d';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();

    getPopularMovies();
  }

  Future<String> _getJsonData( String endpoint, [int page = 1] ) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiUrl,
      'language': _language,
      'page': '$page'
    });

    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData( '/3/movie/now_playing' );

    final nowPlayingResponse = NowPlayingRresponse.fromJson( jsonData );
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData( '/3/movie/popular', _popularPage );

    final popularResponse = PopularResponse.fromJson( jsonData );
    
    popularMovies = [ ...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
