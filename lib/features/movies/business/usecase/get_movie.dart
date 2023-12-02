import 'package:dartz/dartz.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/movies/business/entity/movie_entity.dart';
import 'package:movie_db/features/movies/business/repository/movie_repository.dart';

class GetMovie {
  final MovieRepository repository;

  GetMovie(this.repository);

  Future<Either<Failure, MovieEntity>> call(
      {required MovieParams params}) async {
    return await repository.getMovie(params: params);
  }
}
