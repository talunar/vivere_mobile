import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/user_id.dart'; // Импорт UserId из Core

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @UserIdConverter() required UserId id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required int age,
    required double weight,
    required double height,
    @JsonKey(name: 'birth_date') required String birthDate,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}