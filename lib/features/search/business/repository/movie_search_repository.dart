import 'package:dartz/dartz.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/search/business/entities/movie_search_entity.dart';

abstract class MovieSearchRepository {
  Future<Either<Failure, MovieSearchEntity>> getMovies(
      {required MovieSearchParams query});
}
