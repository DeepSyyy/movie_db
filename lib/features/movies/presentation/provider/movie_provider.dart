import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_db/core/connections/network_info.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/movies/business/entity/movie_entity.dart';
import 'package:movie_db/features/movies/business/usecase/get_movie.dart';
import 'package:movie_db/features/movies/data/datasource/movie_local_data_source.dart';
import 'package:movie_db/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_db/features/movies/data/repositroy/movie_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieProvider extends ChangeNotifier {
  MovieEntity? movieEntity;
  Failure? failure;

  MovieProvider({this.movieEntity, this.failure});

  void eitherFailureOrMovie({
    required String value,
  }) async {
    try {
      MovieRepositoryImpl repo = MovieRepositoryImpl(
        remoteDataSource: MovieModelRemoteDataSourceImpl(dio: Dio()),
        localDataSource: MovieModelLocalDataSourceImpl(
            sharedPreferences: await SharedPreferences.getInstance()),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      );

      final failureOrMovie = await GetMovie(repo).call(
        params: MovieParams(id: value),
      );

      failureOrMovie.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      }, (newMovie) {
        movieEntity = newMovie;
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');

      // You can throw a custom exception or set an appropriate error state
      failure = NotFoundFailure(errorMessage: "The movie was not found");
      notifyListeners();
    }
  }
}
