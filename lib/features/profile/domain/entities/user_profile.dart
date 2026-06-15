import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:vivere_mobile/core/domain/entities/user_id.dart';
import 'package:vivere_mobile/core/domain/value_objects/app_value_objects.dart';
import 'package:vivere_mobile/features/profile/domain/value_objects/physical_parameters.dart';
import 'package:vivere_mobile/core/domain/entities/gender.dart'; // Импорт из core

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @UserIdConverter() required UserId id,
    @JsonKey(name: 'nick_name') @NickNameConverter() required NickName nickName,
    @EmailConverter() required Email email,
    @JsonKey(name: 'first_name') @NameConverter() required Name firstName,
    @JsonKey(name: 'last_name') @NameConverter() required Name lastName,
    @AgeConverter() required Age age,
    @WeightConverter() required Weight weight,
    @HeightConverter() required Height height,
    @GenderConverter() required Gender gender,

    @JsonKey(name: 'birth_date')
    @_DateTimeConverter() required DateTime birthDate,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

class GenderConverter implements JsonConverter<Gender, int> {
  const GenderConverter();
  
  @override
  Gender fromJson(int json) {
    if (json == 2) return Gender.female;
    if (json == 3) return Gender.other;
    return Gender.male;
  }

  @override
  int toJson(Gender object) {
    switch (object) {
      case Gender.male: return 1;
      case Gender.female: return 2;
      case Gender.other: return 3;
    }
  }
}

class NickNameConverter implements JsonConverter<NickName, String> {
  const NickNameConverter();
  @override
  NickName fromJson(String json) => NickName(json);
  @override
  String toJson(NickName object) => object.value;
}

class EmailConverter implements JsonConverter<Email, String> {
  const EmailConverter();
  @override
  Email fromJson(String json) => Email(json);
  @override
  String toJson(Email object) => object.value;
}

class NameConverter implements JsonConverter<Name, String> {
  const NameConverter();
  @override
  Name fromJson(String json) => Name(json);
  @override
  String toJson(Name object) => object.value;
}

class AgeConverter implements JsonConverter<Age, int> {
  const AgeConverter();
  @override
  Age fromJson(int json) => Age(json);
  @override
  int toJson(Age object) => object.value;
}

class WeightConverter implements JsonConverter<Weight, int> {
  const WeightConverter();
  @override
  Weight fromJson(num json) => Weight(json.toDouble());
  @override
  int toJson(Weight object) => object.value.round();
}

class HeightConverter implements JsonConverter<Height, int> {
  const HeightConverter();
  @override
  Height fromJson(num json) => Height(json.toDouble());
  @override
  int toJson(Height object) => object.value.round();
}

class _DateTimeConverter implements JsonConverter<DateTime, String> {
  const _DateTimeConverter();
  @override
  DateTime fromJson(String json) => DateFormat('dd.MM.yyyy').parse(json);
  @override
  String toJson(DateTime object) => DateFormat('dd.MM.yyyy').format(object);
}
