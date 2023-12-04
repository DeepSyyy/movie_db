import 'package:flutter/material.dart';
import 'package:movie_db/features/search/presentation/widget/data_page.dart';

class DataSearchPage extends StatelessWidget {
  DataSearchPage({super.key, required this.controller});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DataSearchWidget(
      controller: controller,
    );
  }
}
