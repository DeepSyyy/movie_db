import 'package:movie_db/features/search/business/entities/sub_entities.dart';

class SearchModel extends SearchEntity {
  final String title;
  final String year;
  final String imdbId;
  final TypeModel type;
  final String poster;

  SearchModel({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  }) : super(
          title: title,
          year: year,
          imdbId: imdbId,
          type: type,
          poster: poster,
        );

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: TypeModel.fromJson(json["Type"]),
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}

class TypeModel extends TypeEntity {
  TypeModel({
    required String value,
  }) : super(
          value: value,
        );

  factory TypeModel.fromJson(String json) => TypeModel(
        value: json,
      );

  String toJson() => value;
}
