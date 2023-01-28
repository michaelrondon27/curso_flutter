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

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, {int page = 0, String query = '' }) async {
    final parameters = {
      'api_key': _apiKey,
      'language': _language
    };

    if (page > 0) parameters.addAll({'page': '$page'});

    if (query.isNotEmpty) parameters.addAll({'query': query});

    final url = Uri.https(_baseUrl, endpoint, parameters);

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', page: _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    
    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final jsonData = await _getJsonData('3/search/movie', query: query);
    final searchResponse = SearchResponse.fromJson(jsonData);

    return searchResponse.results;
  }

}