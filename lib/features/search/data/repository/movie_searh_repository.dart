import 'package:dartz/dartz.dart';
import 'package:movie_db/core/connections/network_info.dart';
import 'package:movie_db/core/errors/exceptions.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/search/business/repository/movie_search_repository.dart';
import 'package:movie_db/features/search/data/datasource/movie_search_local_data_source.dart';
import 'package:movie_db/features/search/data/datasource/movie_search_remote_data_source.dart';
import 'package:movie_db/features/search/data/model/movie_searc_model.dart';

class MovieSearchRepositoryImpl implements MovieSearchRepository {
  final MovieSearchRemoteDataSource remoteDataSource;
  final MovieSearchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MovieSearchRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MovieSearchModel>> getMovies(
      {required MovieSearchParams query}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteMovies = await remoteDataSource.getMovies(query: query);
        localDataSource.cachedMovies(remoteMovies);
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Server Error'));
      }
    } else {
      try {
        final localMovies = await localDataSource.getLastMovies();
        return Right(localMovies);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'Cache Error'));
      }
    }
  }
}
