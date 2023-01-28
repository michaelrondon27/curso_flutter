import 'dart:convert';

import 'package:peliculas/models/movie_model.dart';

class SearchResponse {
  SearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
    page: json["page"],
    results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}
