import 'package:flutter/material.dart';
import 'package:movie_db/features/search/presentation/provider/movie_search_provider.dart';
import 'package:provider/provider.dart';

class SearchBarMine extends StatefulWidget {
  SearchBarMine(
      {super.key, required this.controller, required this.handleSearch});
  TextEditingController controller = TextEditingController();
  final void Function() handleSearch;

  @override
  State<SearchBarMine> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarMine> {
  void initState() {
    Provider.of<MovieSearchProvider>(context, listen: false)
        .eitherFailureOrMovieSearch(value: 'Avatar');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: widget.handleSearch,
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
