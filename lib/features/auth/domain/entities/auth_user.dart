import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    @UserIdConverter() required UserId id,
    required String email,
    String? nickName,
    String? token,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
}