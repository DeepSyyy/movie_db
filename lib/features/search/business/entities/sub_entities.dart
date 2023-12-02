class SearchEntity {
  final String title;
  final String year;
  final String imdbId;
  final TypeEntity type;
  final String poster;

  SearchEntity({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });
}

class TypeEntity {
  final String value;

  TypeEntity({
    required this.value,
  });
}
