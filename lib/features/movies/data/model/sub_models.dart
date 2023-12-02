import 'package:movie_db/features/movies/business/entity/sub_entities.dart';

class RatingsModel extends RatingsEntity {
  final String source;
  final String value;

  RatingsModel({
    required this.source,
    required this.value,
  }) : super(
          source: source,
          value: value,
        );

  factory RatingsModel.fromJson(Map<String, dynamic> json) => RatingsModel(
        source: json["Source"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source,
        "Value": value,
      };
}
