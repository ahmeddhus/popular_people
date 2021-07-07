// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonProfiles _$PersonProfilesFromJson(Map<String, dynamic> json) {
  return PersonProfiles(
    aspectRatio: (json['aspect_ratio'] as num)?.toDouble(),
    height: json['height'] as int,
    iso6391: json['iso_639_1'],
    filePath: json['file_path'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
    width: json['width'] as int,
  );
}

Map<String, dynamic> _$PersonProfilesToJson(PersonProfiles instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'voteCount': instance.voteCount,
      'width': instance.width,
    };
