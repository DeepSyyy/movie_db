import 'package:dartz/dartz.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/movies/business/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieEntity>> getMovie({required MovieParams params});
}
