import 'package:movie_db/features/search/business/entities/sub_entities.dart';

class MovieSearchEntity {
  final List<SearchEntity> search;
  final String totalResults;
  final String response;

  MovieSearchEntity({
    required this.search,
    required this.totalResults,
    required this.response,
  });
}
