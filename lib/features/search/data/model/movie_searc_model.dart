import 'package:movie_db/features/search/business/entities/movie_search_entity.dart';
import 'package:movie_db/features/search/data/model/sub_entities.dart';

class MovieSearchModel extends MovieSearchEntity {
  final List<SearchModel> search;
  final String totalResults;
  final String response;

  MovieSearchModel({
    required this.search,
    required this.totalResults,
    required this.response,
  }) : super(
          search: search,
          totalResults: totalResults,
          response: response,
        );

  factory MovieSearchModel.fromMap(Map<String, dynamic> json) =>
      MovieSearchModel(
        search: List<SearchModel>.from(
            json["Search"].map((x) => SearchModel.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toMap() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}
