import 'package:freezed_annotation/freezed_annotation.dart';import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/domain/value_objects/app_value_objects.dart';
import '../value_objects/physical_parameters.dart';
import 'package:intl/intl.dart';

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

    @JsonKey(name: 'birth_date')
    @_DateTimeConverter() required DateTime birthDate,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
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
  int toJson(Height object) => object.value.round(); // Округляем для Go uint8
}

class _DateTimeConverter implements JsonConverter<DateTime, String> {
  const _DateTimeConverter();
  @override
  DateTime fromJson(String json) => DateFormat('dd.MM.yyyy').parse(json);
  @override
  String toJson(DateTime object) => DateFormat('dd.MM.yyyy').format(object);
}