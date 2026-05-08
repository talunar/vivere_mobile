import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../value_objects/physical_parameters.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required UserId id,
    required String nickName,
    required String email,
    required String firstName,
    required String lastName,
    required int age,
    required Weight weight,
    required Height height,
    required DateTime birthDate,
  }) = _UserProfile;
}
