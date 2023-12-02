import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/core/connections/network_info.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/search/business/entities/movie_search_entity.dart';
import 'package:movie_db/features/search/data/datasource/movie_search_local_data_source.dart';
import 'package:movie_db/features/search/data/datasource/movie_search_remote_data_source.dart';
import 'package:movie_db/features/search/data/repository/movie_searh_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieSearchProvider extends ChangeNotifier {
  MovieSearchEntity? movieSearchEntity;
  Failure? failure;

  MovieSearchProvider({this.movieSearchEntity, this.failure});

  void eitherFailureOrMovieSearch({
    required String value,
  }) async {
    try {
      MovieSearchRepositoryImpl repository = MovieSearchRepositoryImpl(
        remoteDataSource: MovieSearchModelRemoteDataSourceImpl(dio: Dio()),
        localDataSource: MovieSearchLocalDataSourceImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
        networkInfo: NetworkInfoImpl(
          DataConnectionChecker(),
        ),
      );
      final failureOrMovieSearch = await repository.getMovies(
        query: MovieSearchParams(query: value),
      );

      failureOrMovieSearch.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      }, (newMovieSearch) {
        movieSearchEntity = newMovieSearch;
        notifyListeners();
      });
    } catch (e) {
      print('Exception: $e');
      failure = NotFoundFailure(errorMessage: "The movie was not found");
      notifyListeners();
    }
  }
}
