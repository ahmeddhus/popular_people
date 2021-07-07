import 'package:json_annotation/json_annotation.dart';

part 'person_details.g.dart';

@JsonSerializable()
class PersonDetails {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  String birthday;
  dynamic deathday;
  int gender;
  dynamic homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  PersonDetails({
      this.adult, 
      this.alsoKnownAs, 
      this.biography, 
      this.birthday, 
      this.deathday, 
      this.gender, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.knownForDepartment, 
      this.name, 
      this.placeOfBirth, 
      this.popularity, 
      this.profilePath});


  factory PersonDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailsToJson(this);
}