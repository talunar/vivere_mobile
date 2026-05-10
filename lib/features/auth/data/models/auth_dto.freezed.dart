// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) {
  return _AuthDto.fromJson(json);
}

/// @nodoc
mixin _$AuthDto {
  @JsonKey(name: 'nick_name')
  String? get nickName => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password2')
  String? get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this AuthDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthDtoCopyWith<AuthDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDtoCopyWith<$Res> {
  factory $AuthDtoCopyWith(AuthDto value, $Res Function(AuthDto) then) =
      _$AuthDtoCopyWithImpl<$Res, AuthDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'nick_name') String? nickName,
    String? password,
    @JsonKey(name: 'password2') String? confirmPassword,
  });
}

/// @nodoc
class _$AuthDtoCopyWithImpl<$Res, $Val extends AuthDto>
    implements $AuthDtoCopyWith<$Res> {
  _$AuthDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(
      _value.copyWith(
            nickName: freezed == nickName
                ? _value.nickName
                : nickName // ignore: cast_nullable_to_non_nullable
                      as String?,
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            confirmPassword: freezed == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthDtoImplCopyWith<$Res> implements $AuthDtoCopyWith<$Res> {
  factory _$$AuthDtoImplCopyWith(
    _$AuthDtoImpl value,
    $Res Function(_$AuthDtoImpl) then,
  ) = __$$AuthDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'nick_name') String? nickName,
    String? password,
    @JsonKey(name: 'password2') String? confirmPassword,
  });
}

/// @nodoc
class __$$AuthDtoImplCopyWithImpl<$Res>
    extends _$AuthDtoCopyWithImpl<$Res, _$AuthDtoImpl>
    implements _$$AuthDtoImplCopyWith<$Res> {
  __$$AuthDtoImplCopyWithImpl(
    _$AuthDtoImpl _value,
    $Res Function(_$AuthDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(
      _$AuthDtoImpl(
        nickName: freezed == nickName
            ? _value.nickName
            : nickName // ignore: cast_nullable_to_non_nullable
                  as String?,
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        confirmPassword: freezed == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthDtoImpl implements _AuthDto {
  const _$AuthDtoImpl({
    @JsonKey(name: 'nick_name') this.nickName,
    this.password,
    @JsonKey(name: 'password2') this.confirmPassword,
  });

  factory _$AuthDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthDtoImplFromJson(json);

  @override
  @JsonKey(name: 'nick_name')
  final String? nickName;
  @override
  final String? password;
  @override
  @JsonKey(name: 'password2')
  final String? confirmPassword;

  @override
  String toString() {
    return 'AuthDto(nickName: $nickName, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthDtoImpl &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nickName, password, confirmPassword);

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthDtoImplCopyWith<_$AuthDtoImpl> get copyWith =>
      __$$AuthDtoImplCopyWithImpl<_$AuthDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthDtoImplToJson(this);
  }
}

abstract class _AuthDto implements AuthDto {
  const factory _AuthDto({
    @JsonKey(name: 'nick_name') final String? nickName,
    final String? password,
    @JsonKey(name: 'password2') final String? confirmPassword,
  }) = _$AuthDtoImpl;

  factory _AuthDto.fromJson(Map<String, dynamic> json) = _$AuthDtoImpl.fromJson;

  @override
  @JsonKey(name: 'nick_name')
  String? get nickName;
  @override
  String? get password;
  @override
  @JsonKey(name: 'password2')
  String? get confirmPassword;

  /// Create a copy of AuthDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthDtoImplCopyWith<_$AuthDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
