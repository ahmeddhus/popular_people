
import 'package:json_annotation/json_annotation.dart';

part 'known_for.g.dart';

@JsonSerializable()
class KnownFor {
  String backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String mediaType;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  dynamic voteAverage;
  int voteCount;

  KnownFor(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.mediaType,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  factory KnownFor.fromJson(Map<String, dynamic> json) =>
      _$KnownForFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
