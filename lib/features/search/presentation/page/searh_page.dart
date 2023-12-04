import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/features/search/presentation/widget/handle_search.dart';

class SearchBarPage extends StatelessWidget {
  SearchBarPage(
      {super.key, required this.controller, required this.handleSearch});
  TextEditingController controller = TextEditingController();
  void Function() handleSearch;

  @override
  Widget build(BuildContext context) {
    return SearchBarMine(
      controller: controller,
      handleSearch: handleSearch,
    );
  }
}
