import 'dart:convert';

import 'package:movie_db/core/errors/exceptions.dart';
import 'package:movie_db/features/search/data/model/movie_searc_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieSearchLocalDataSource {
  Future<void>? cachedMovies(MovieSearchModel? movieToCache);

  Future<MovieSearchModel> getLastMovies();
}

const cachedMovie = 'CACHED_MOVIES';

class MovieSearchLocalDataSourceImpl implements MovieSearchLocalDataSource {
  final SharedPreferences sharedPreferences;

  MovieSearchLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<MovieSearchModel> getLastMovies() {
    final jsonString = sharedPreferences.getString(cachedMovie);
    if (jsonString != null) {
      return Future.value(MovieSearchModel.fromMap(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cachedMovies(MovieSearchModel? movieToCache) async {
    if (movieToCache != null) {
      sharedPreferences.setString(
        cachedMovie,
        json.encode(movieToCache.toMap()),
      );
    } else {
      throw CacheException();
    }
  }
}
