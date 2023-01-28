import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = '7a3f4cbe05801e3adbec1ac98275422d';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  
  List<MovieModel> onDisplayMovies = [];
  List<MovieModel> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

}