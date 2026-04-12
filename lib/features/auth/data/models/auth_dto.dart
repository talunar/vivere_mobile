import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
class AuthDto with _$AuthDto {
  const factory AuthDto({
    // Мапим nick_name из Go в nickName в Dart
    @JsonKey(name: 'nick_name') required String nickName,
    required String password,
    // В Go это password2, во Flutter назовем confirmPassword
    @JsonKey(name: 'password2') String? confirmPassword,
  }) = _AuthDto;

  factory AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);
}