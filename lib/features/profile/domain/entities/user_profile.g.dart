// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: const UserIdConverter().fromJson((json['id'] as num).toInt()),
      nickName: const NickNameConverter().fromJson(json['nick_name'] as String),
      email: const EmailConverter().fromJson(json['email'] as String),
      firstName: const NameConverter().fromJson(json['first_name'] as String),
      lastName: const NameConverter().fromJson(json['last_name'] as String),
      age: const AgeConverter().fromJson((json['age'] as num).toInt()),
      weight: const WeightConverter().fromJson((json['weight'] as num).toInt()),
      height: const HeightConverter().fromJson((json['height'] as num).toInt()),
      gender: const GenderConverter().fromJson((json['gender'] as num).toInt()),
      birthDate: const _DateTimeConverter().fromJson(
        json['birth_date'] as String,
      ),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': const UserIdConverter().toJson(instance.id),
      'nick_name': const NickNameConverter().toJson(instance.nickName),
      'email': const EmailConverter().toJson(instance.email),
      'first_name': const NameConverter().toJson(instance.firstName),
      'last_name': const NameConverter().toJson(instance.lastName),
      'age': const AgeConverter().toJson(instance.age),
      'weight': const WeightConverter().toJson(instance.weight),
      'height': const HeightConverter().toJson(instance.height),
      'gender': const GenderConverter().toJson(instance.gender),
      'birth_date': const _DateTimeConverter().toJson(instance.birthDate),
    };
