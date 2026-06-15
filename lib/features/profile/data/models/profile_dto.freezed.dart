// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) {
  return _ProfileDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nick_name')
  String get nickName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  int get gender =>
      throw _privateConstructorUsedError; // 1 - муж, 2 - жен, 3 - другое
  @JsonKey(name: 'birth_date')
  String get birthDate => throw _privateConstructorUsedError;

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileDtoCopyWith<ProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDtoCopyWith<$Res> {
  factory $ProfileDtoCopyWith(
    ProfileDto value,
    $Res Function(ProfileDto) then,
  ) = _$ProfileDtoCopyWithImpl<$Res, ProfileDto>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'nick_name') String nickName,
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    int age,
    double weight,
    double height,
    int gender,
    @JsonKey(name: 'birth_date') String birthDate,
  });
}

/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res, $Val extends ProfileDto>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
    Object? weight = null,
    Object? height = null,
    Object? gender = null,
    Object? birthDate = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            nickName: null == nickName
                ? _value.nickName
                : nickName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as int,
            birthDate: null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileDtoImplCopyWith<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  factory _$$ProfileDtoImplCopyWith(
    _$ProfileDtoImpl value,
    $Res Function(_$ProfileDtoImpl) then,
  ) = __$$ProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'nick_name') String nickName,
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    int age,
    double weight,
    double height,
    int gender,
    @JsonKey(name: 'birth_date') String birthDate,
  });
}

/// @nodoc
class __$$ProfileDtoImplCopyWithImpl<$Res>
    extends _$ProfileDtoCopyWithImpl<$Res, _$ProfileDtoImpl>
    implements _$$ProfileDtoImplCopyWith<$Res> {
  __$$ProfileDtoImplCopyWithImpl(
    _$ProfileDtoImpl _value,
    $Res Function(_$ProfileDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
    Object? weight = null,
    Object? height = null,
    Object? gender = null,
    Object? birthDate = null,
  }) {
    return _then(
      _$ProfileDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        nickName: null == nickName
            ? _value.nickName
            : nickName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as int,
        birthDate: null == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDtoImpl extends _ProfileDto {
  const _$ProfileDtoImpl({
    required this.id,
    @JsonKey(name: 'nick_name') required this.nickName,
    required this.email,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
    @JsonKey(name: 'birth_date') required this.birthDate,
  }) : super._();

  factory _$ProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nick_name')
  final String nickName;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final int age;
  @override
  final double weight;
  @override
  final double height;
  @override
  final int gender;
  // 1 - муж, 2 - жен, 3 - другое
  @override
  @JsonKey(name: 'birth_date')
  final String birthDate;

  @override
  String toString() {
    return 'ProfileDto(id: $id, nickName: $nickName, email: $email, firstName: $firstName, lastName: $lastName, age: $age, weight: $weight, height: $height, gender: $gender, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nickName,
    email,
    firstName,
    lastName,
    age,
    weight,
    height,
    gender,
    birthDate,
  );

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDtoImplCopyWith<_$ProfileDtoImpl> get copyWith =>
      __$$ProfileDtoImplCopyWithImpl<_$ProfileDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDtoImplToJson(this);
  }
}

abstract class _ProfileDto extends ProfileDto {
  const factory _ProfileDto({
    required final int id,
    @JsonKey(name: 'nick_name') required final String nickName,
    required final String email,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    required final int age,
    required final double weight,
    required final double height,
    required final int gender,
    @JsonKey(name: 'birth_date') required final String birthDate,
  }) = _$ProfileDtoImpl;
  const _ProfileDto._() : super._();

  factory _ProfileDto.fromJson(Map<String, dynamic> json) =
      _$ProfileDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nick_name')
  String get nickName;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  int get age;
  @override
  double get weight;
  @override
  double get height;
  @override
  int get gender; // 1 - муж, 2 - жен, 3 - другое
  @override
  @JsonKey(name: 'birth_date')
  String get birthDate;

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileDtoImplCopyWith<_$ProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
