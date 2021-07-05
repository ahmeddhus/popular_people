import 'package:json_annotation/json_annotation.dart';
import 'package:popular_people/models/person/person.dart';

part 'person_response.g.dart';

@JsonSerializable()
class PersonResponse {
  int page;
  List<Person> results;
  int totalPages;
  int totalResults;

  PersonResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults});

  factory PersonResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}