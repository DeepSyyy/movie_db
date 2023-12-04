import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db/features/movies/presentation/provider/movie_provider.dart';
import 'package:movie_db/features/search/presentation/page/data_search_page.dart';
import 'package:movie_db/features/search/presentation/page/searh_page.dart';
import 'package:movie_db/features/search/presentation/provider/movie_search_provider.dart';
import 'package:movie_db/features/search/presentation/widget/handle_search.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieProvider()),
        ChangeNotifierProvider(create: (context) => MovieSearchProvider()),
      ],
      child: const MaterialApp(
        home: MyHomePage(title: 'Movie DB'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  void initState() {
    // Provider.of<MovieProvider>(context, listen: false)
    //     .eitherFailureOrMovie(value: 'tt3896198');
    Provider.of<MovieSearchProvider>(context, listen: false)
        .eitherFailureOrMovieSearch(value: 'Avatar');
    super.initState();
  }

  void handleSearch() {
    String query = controller.text;
    if (query.isNotEmpty) {
      Provider.of<MovieSearchProvider>(context, listen: false)
          .eitherFailureOrMovieSearch(value: query);
    } else {
      initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SearchBarPage(
            controller: controller,
            handleSearch: handleSearch,
          ),
          Expanded(
            child: DataSearchPage(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
