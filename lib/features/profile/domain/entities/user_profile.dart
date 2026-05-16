import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/domain/value_objects/app_value_objects.dart';
import '../value_objects/physical_parameters.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required UserId id,
    required NickName nickName,
    required Email email,
    required Name firstName,
    required Name lastName,
    required Age age,
    required Weight weight,
    required Height height,
    required DateTime birthDate,
  }) = _UserProfile;
}
