import 'package:json_annotation/json_annotation.dart';

part 'person_profiles.g.dart';

@JsonSerializable()
class PersonProfiles {
  double aspectRatio;
  int height;
  dynamic iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  PersonProfiles(
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  factory PersonProfiles.fromJson(Map<String, dynamic> json) =>
      _$PersonProfilesFromJson(json);

  Map<String, dynamic> toJson() => _$PersonProfilesToJson(this);
}
