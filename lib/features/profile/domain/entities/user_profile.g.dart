// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: const UserIdConverter().fromJson((json['id'] as num).toInt()),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      birthDate: json['birth_date'] as String,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': const UserIdConverter().toJson(instance.id),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'birth_date': instance.birthDate,
    };
