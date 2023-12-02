import 'package:dartz/dartz.dart';
import 'package:movie_db/core/connections/network_info.dart';
import 'package:movie_db/core/errors/exceptions.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/movies/business/repository/movie_repository.dart';
import 'package:movie_db/features/movies/data/datasource/movie_local_data_source.dart';
import 'package:movie_db/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_db/features/movies/data/model/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MovieModel>> getMovie(
      {required MovieParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovie = await remoteDataSource.getMovie(params: params);
        localDataSource.cachedMovie(remoteMovie);
        return Right(remoteMovie);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Server Error'));
      }
    } else {
      try {
        final localMovie = await localDataSource.getLastMovie();
        return Right(localMovie);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'Cache Error'));
      }
    }
  }
}
