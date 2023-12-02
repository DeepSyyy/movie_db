import 'dart:convert';

import 'package:movie_db/core/errors/exceptions.dart';
import 'package:movie_db/features/movies/data/model/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieLocalDataSource {
  Future<void>? cachedMovie(MovieModel? movieToCache);

  Future<MovieModel> getLastMovie();
}

const cachedMovies = 'CACHED_MOVIES';

class MovieModelLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPreferences sharedPreferences;

  MovieModelLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<MovieModel> getLastMovie() {
    final jsonString = sharedPreferences.getString(cachedMovies);
    if (jsonString != null) {
      return Future.value(MovieModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cachedMovie(MovieModel? movieToCache) async {
    if (movieToCache != null) {
      sharedPreferences.setString(
        cachedMovies,
        json.encode(movieToCache.toJson()),
      );
    } else {
      throw CacheException();
    }
  }
}
