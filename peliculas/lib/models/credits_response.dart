import 'dart:convert';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CreditsResponse.fromJson(String str) => CreditsResponse.fromMap(json.decode(str));

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
      id: json["id"],
      cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
      crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  );
}

class Cast {
  Cast({
    required this.adult,
    this.castId,
    this.character,
    required this.creditId,
    this.department,
    required this.gender,
    required this.id,
    this.job,
    required this.knownForDepartment,
    required this.name,
    this.order,
    required this.originalName,
    required this.popularity,
    this.profilePath,
  });

  bool adult;
  int? castId;
  String? character;
  String creditId;
  String? department;
  int gender;
  int id;
  String? job;
  String knownForDepartment;
  String name;
  int? order;
  String originalName;
  double popularity;
  String? profilePath;

  get fullProfilePath {
    if ( this.profilePath != null ) 
      return  'https://image.tmdb.org/t/p/w500${ this.profilePath }';
    
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
    adult             : json["adult"],
    castId            : json["cast_id"] == null ? null : json["cast_id"],
    character         : json["character"] == null ? null : json["character"],
    creditId          : json["credit_id"],
    department        : json["department"] == null ? null : json["department"],
    gender            : json["gender"],
    id                : json["id"],
    job               : json["job"] == null ? null : json["job"],
    knownForDepartment: json["known_for_department"],
    name              : json["name"],
    order             : json["order"] == null ? null : json["order"],
    originalName      : json["original_name"],
    popularity        : json["popularity"].toDouble(),
    profilePath       : json["profile_path"] == null ? null : json["profile_path"],
  );
}
