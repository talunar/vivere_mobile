// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nick_name')
  String get nickName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String get birthDate => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'nick_name') String nickName,
    String email,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'first_name') String firstName,
    int age,
    int weight,
    int height,
    @JsonKey(name: 'birth_date') String birthDate,
  });
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? email = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? age = null,
    Object? weight = null,
    Object? height = null,
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
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'nick_name') String nickName,
    String email,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'first_name') String firstName,
    int age,
    int weight,
    int height,
    @JsonKey(name: 'birth_date') String birthDate,
  });
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickName = null,
    Object? email = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? age = null,
    Object? weight = null,
    Object? height = null,
    Object? birthDate = null,
  }) {
    return _then(
      _$UserProfileImpl(
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
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
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
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    required this.id,
    @JsonKey(name: 'nick_name') required this.nickName,
    required this.email,
    @JsonKey(name: 'last_name') required this.lastName,
    @JsonKey(name: 'first_name') required this.firstName,
    required this.age,
    required this.weight,
    required this.height,
    @JsonKey(name: 'birth_date') required this.birthDate,
  });

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nick_name')
  final String nickName;
  @override
  final String email;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final int age;
  @override
  final int weight;
  @override
  final int height;
  @override
  @JsonKey(name: 'birth_date')
  final String birthDate;

  @override
  String toString() {
    return 'UserProfile(id: $id, nickName: $nickName, email: $email, lastName: $lastName, firstName: $firstName, age: $age, weight: $weight, height: $height, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
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
    lastName,
    firstName,
    age,
    weight,
    height,
    birthDate,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    required final int id,
    @JsonKey(name: 'nick_name') required final String nickName,
    required final String email,
    @JsonKey(name: 'last_name') required final String lastName,
    @JsonKey(name: 'first_name') required final String firstName,
    required final int age,
    required final int weight,
    required final int height,
    @JsonKey(name: 'birth_date') required final String birthDate,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nick_name')
  String get nickName;
  @override
  String get email;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  int get age;
  @override
  int get weight;
  @override
  int get height;
  @override
  @JsonKey(name: 'birth_date')
  String get birthDate;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
