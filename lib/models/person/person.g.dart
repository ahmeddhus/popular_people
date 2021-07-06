// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    adult: json['adult'] as bool ?? false,
    gender: json['gender'] as int ?? 0,
    id: json['id'] as int ?? 0,
    knownFor: (json['known_for'] as List)
        ?.map((e) =>
            e == null ? null : KnownFor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    knownForDepartment: json['known_for_department'] as String ?? '',
    name: json['name'] as String ?? '',
    popularity: (json['popularity'] as num)?.toDouble() ?? 0.0,
    profilePath: json['profile_path'] as String ?? '',
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
