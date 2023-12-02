import 'package:dartz/dartz.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/search/business/entities/movie_search_entity.dart';
import 'package:movie_db/features/search/business/repository/movie_search_repository.dart';

class GetMovies {
  final MovieSearchRepository repository;

  GetMovies(this.repository);

  Future<Either<Failure, MovieSearchEntity>> call(
      {required MovieSearchParams params}) async {
    return await repository.getMovies(query: params);
  }
}
