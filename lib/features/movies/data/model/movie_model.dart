import 'package:movie_db/core/constants/constant.dart';
import 'package:movie_db/features/movies/business/entity/movie_entity.dart';
import 'package:movie_db/features/movies/data/model/sub_models.dart';

class MovieModel extends MovieEntity {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final List<RatingsModel> ratings;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbId;
  final String type;
  final String dvd;
  final String boxOffice;
  final String production;
  final String website;
  final String response;

  MovieModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response,
  }) : super(
          title: title,
          year: year,
          rated: rated,
          released: released,
          runtime: runtime,
          genre: genre,
          director: director,
          writer: writer,
          actors: actors,
          plot: plot,
          language: language,
          country: country,
          awards: awards,
          poster: poster,
          ratings: ratings,
          metascore: metascore,
          imdbRating: imdbRating,
          imdbVotes: imdbVotes,
          imdbId: imdbId,
          type: type,
          dvd: dvd,
          boxOffice: boxOffice,
          production: production,
          website: website,
          response: response,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json[kTitle],
      year: json[kYear],
      rated: json[kRated],
      released: json[kReleased],
      runtime: json[kRuntime],
      genre: json[kGenre],
      director: json[kDirector],
      writer: json[kWriter],
      actors: json[kActors],
      plot: json[kPlot],
      language: json[kLanguage],
      country: json[kCountry],
      awards: json[kAwards],
      poster: json[kPoster],
      ratings: List<RatingsModel>.from(
          json[kRatings].map((x) => RatingsModel.fromJson(x))),
      metascore: json[kMetascore],
      imdbRating: json[kImdbRating],
      imdbVotes: json[kImdbVotes],
      imdbId: json[kImdbId],
      type: json[kType],
      dvd: json[kDvd],
      boxOffice: json[kBoxOffice],
      production: json[kProduction],
      website: json[kWebsite],
      response: json[kResponse],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kTitle: title,
      kYear: year,
      kRated: rated,
      kReleased: released,
      kRuntime: runtime,
      kGenre: genre,
      kDirector: director,
      kWriter: writer,
      kActors: actors,
      kPlot: plot,
      kLanguage: language,
      kCountry: country,
      kAwards: awards,
      kPoster: poster,
      kRatings: List<dynamic>.from(ratings.map((x) => x.toJson())),
      kMetascore: metascore,
      kImdbRating: imdbRating,
      kImdbVotes: imdbVotes,
      kImdbId: imdbId,
      kType: type,
      kDvd: dvd,
      kBoxOffice: boxOffice,
      kProduction: production,
      kWebsite: website,
      kResponse: response,
    };
  }
}
