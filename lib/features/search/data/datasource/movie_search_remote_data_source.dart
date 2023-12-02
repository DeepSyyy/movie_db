import 'package:dio/dio.dart';
import 'package:movie_db/core/params/params.dart';
import 'package:movie_db/features/search/data/model/movie_searc_model.dart';

abstract class MovieSearchRemoteDataSource {
  Future<MovieSearchModel> getMovies({required MovieSearchParams query});
}

class MovieSearchModelRemoteDataSourceImpl
    implements MovieSearchRemoteDataSource {
  final Dio dio;

  MovieSearchModelRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieSearchModel> getMovies({required MovieSearchParams query}) async {
    final response = await dio.get(
      'http://www.omdbapi.com/',
      queryParameters: {
        'apikey': 'ur api key',
        's': query.query,
      },
    );

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return MovieSearchModel.fromMap(response.data);
    } else {
      throw Exception();
    }
  }
}
