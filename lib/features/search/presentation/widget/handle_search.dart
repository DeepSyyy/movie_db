import 'package:flutter/material.dart';
import 'package:movie_db/features/search/presentation/provider/movie_search_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();

  void initState() {
    Provider.of<MovieSearchProvider>(context, listen: false)
        .eitherFailureOrMovieSearch(value: 'Batman');
    super.initState();
  }

  void handleSearch() {
    String query = controller.text;
    Provider.of<MovieSearchProvider>(context, listen: false)
        .eitherFailureOrMovieSearch(value: query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: handleSearch,
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
