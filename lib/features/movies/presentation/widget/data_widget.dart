import 'package:movie_db/core/errors/failure.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/features/movies/business/entity/movie_entity.dart';
import 'package:movie_db/features/movies/presentation/provider/movie_provider.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MovieEntity? movieEntity = Provider.of<MovieProvider>(context).movieEntity;
    Failure? failure = Provider.of<MovieProvider>(context).failure;
    late Widget widget;
    if (movieEntity != null) {
      widget = SingleChildScrollView(
        child: Column(
          children: [],
        ),
      );
    } else if (failure != null) {
      widget = Text(failure.errorMessage);
    } else {
      widget = const CircularProgressIndicator();
    }

    return widget;
  }
}
