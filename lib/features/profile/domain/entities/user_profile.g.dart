// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: (json['id'] as num).toInt(),
      nickName: json['nick_name'] as String,
      email: json['email'] as String,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      birthDate: json['birth_date'] as String,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nick_name': instance.nickName,
      'email': instance.email,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'birth_date': instance.birthDate,
    };
