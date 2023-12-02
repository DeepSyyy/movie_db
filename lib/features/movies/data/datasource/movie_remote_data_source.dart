import 'package:dio/dio.dart';
import 'package:movie_db/core/errors/exceptions.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/movies/data/model/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovie({required MovieParams params});
}

class MovieModelRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieModelRemoteDataSourceImpl({required this.dio}) {
    // dio.interceptors
    //     .add(LogInterceptor(responseBody: true)); // Menambahkan interceptor
  }

  @override
  Future<MovieModel> getMovie({required MovieParams params}) async {
    final response = await dio.get(
      'http://www.omdbapi.com/',
      queryParameters: {
        'apikey': 'ur api key',
        'i': params.id,
      },
    );

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
