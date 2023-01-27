import 'dart:convert';

import 'package:peliculas/models/movie_model.dart';

class NowPLayingResponse {
  NowPLayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  factory NowPLayingResponse.fromJson(String str) => NowPLayingResponse.fromMap(json.decode(str));

  factory NowPLayingResponse.fromMap(Map<String, dynamic> json) => NowPLayingResponse(
    dates: Dates.fromMap(json["dates"]),
    page: json["page"],
    results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );
}
