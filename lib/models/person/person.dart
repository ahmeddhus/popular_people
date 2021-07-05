import 'package:json_annotation/json_annotation.dart';
import 'package:popular_people/models/person/known_for.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  bool adult;
  int gender;
  int id;
  List<KnownFor> knownFor;
  String knownForDepartment;
  String name;
  double popularity;
  String profilePath;

  Person({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath});

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}