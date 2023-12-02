import 'package:flutter/material.dart';
import 'package:movie_db/features/movies/presentation/provider/movie_provider.dart';
import 'package:movie_db/features/search/presentation/page/data_search_page.dart';
import 'package:movie_db/features/search/presentation/provider/movie_search_provider.dart';
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
    Provider.of<MovieProvider>(context, listen: false)
        .eitherFailureOrMovie(value: 'tt3896198');
    Provider.of<MovieSearchProvider>(context, listen: false)
        .eitherFailureOrMovieSearch(value: 'Batman');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DataSearchPage(),
    );
  }
}
