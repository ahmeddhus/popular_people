// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonImages _$PersonImagesFromJson(Map<String, dynamic> json) {
  return PersonImages(
    id: json['id'] as int,
    profiles: (json['profiles'] as List)
        ?.map((e) => e == null ? null : PersonProfiles.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$PersonImagesToJson(PersonImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles,
    };
