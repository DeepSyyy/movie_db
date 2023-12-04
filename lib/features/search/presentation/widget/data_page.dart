import 'package:flutter/material.dart';
import 'package:movie_db/core/errors/failure.dart';
import 'package:movie_db/features/search/business/entities/movie_search_entity.dart';
import 'package:movie_db/features/search/presentation/provider/movie_search_provider.dart';
import 'package:provider/provider.dart';

class DataSearchWidget extends StatelessWidget {
  DataSearchWidget({super.key, required this.controller});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MovieSearchEntity? movieSearchEntity =
        Provider.of<MovieSearchProvider>(context).movieSearchEntity;
    Failure? failure = Provider.of<MovieSearchProvider>(context).failure;
    late Widget widget;
    if (movieSearchEntity != null) {
      widget = ListView.builder(
          itemCount: movieSearchEntity.search.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movieSearchEntity.search[index].title),
              subtitle: Text(movieSearchEntity.search[index].year),
              leading: Image.network(movieSearchEntity.search[index].poster),
            );
          });
    } else if (failure != null) {
      widget = Text(failure.errorMessage);
    } else {
      widget = const CircularProgressIndicator();
    }
    return widget;
  }
}
