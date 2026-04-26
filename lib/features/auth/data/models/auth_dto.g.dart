// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthDtoImpl _$$AuthDtoImplFromJson(Map<String, dynamic> json) =>
    _$AuthDtoImpl(
      nickName: json['nick_name'] as String,
      password: json['password'] as String,
      confirmPassword: json['password2'] as String?,
    );

Map<String, dynamic> _$$AuthDtoImplToJson(_$AuthDtoImpl instance) =>
    <String, dynamic>{
      'nick_name': instance.nickName,
      'password': instance.password,
      'password2': instance.confirmPassword,
    };
