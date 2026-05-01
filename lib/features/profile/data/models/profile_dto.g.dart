// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDtoImpl _$$ProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDtoImpl(
      id: (json['id'] as num).toInt(),
      nickName: json['nick_name'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      birthDate: json['birth_date'] as String,
    );

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nick_name': instance.nickName,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'birth_date': instance.birthDate,
    };
