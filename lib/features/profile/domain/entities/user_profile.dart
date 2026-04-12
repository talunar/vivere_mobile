import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    @JsonKey(name: 'nick_name') required String nickName,
    required String email,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'first_name') required String firstName,
    required int age,
    required int weight,
    required int height,
    @JsonKey(name: 'birth_date') required String birthDate,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}