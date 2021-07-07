import 'package:json_annotation/json_annotation.dart';
import 'package:popular_people/models/person_details/person_images/person_profiles.dart';

part 'person_images.g.dart';

@JsonSerializable()
class PersonImages {
  int id;
  List<PersonProfiles> profiles;

  PersonImages({
      this.id, 
      this.profiles});

  factory PersonImages.fromJson(Map<String, dynamic> json) =>
      _$PersonImagesFromJson(json);

  Map<String, dynamic> toJson() => _$PersonImagesToJson(this);
}