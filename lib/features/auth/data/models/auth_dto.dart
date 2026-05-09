import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
class AuthDto with _$AuthDto {
  const factory AuthDto({
    @JsonKey(name: 'nick_name') String? nickName,
    String? password,
    @JsonKey(name: 'password2') String? confirmPassword,
  }) = _AuthDto;

  factory AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);
}