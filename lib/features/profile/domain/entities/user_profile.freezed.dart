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
  @UserIdConverter()
  UserId get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nick_name')
  @NickNameConverter()
  NickName get nickName => throw _privateConstructorUsedError;
  @EmailConverter()
  Email get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  @NameConverter()
  Name get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  @NameConverter()
  Name get lastName => throw _privateConstructorUsedError;
  @AgeConverter()
  Age get age => throw _privateConstructorUsedError;
  @WeightConverter()
  Weight get weight => throw _privateConstructorUsedError;
  @HeightConverter()
  Height get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  @_DateTimeConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;

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
    @UserIdConverter() UserId id,
    @JsonKey(name: 'nick_name') @NickNameConverter() NickName nickName,
    @EmailConverter() Email email,
    @JsonKey(name: 'first_name') @NameConverter() Name firstName,
    @JsonKey(name: 'last_name') @NameConverter() Name lastName,
    @AgeConverter() Age age,
    @WeightConverter() Weight weight,
    @HeightConverter() Height height,
    @JsonKey(name: 'birth_date') @_DateTimeConverter() DateTime birthDate,
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
    Object? firstName = null,
    Object? lastName = null,
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
                      as UserId,
            nickName: null == nickName
                ? _value.nickName
                : nickName // ignore: cast_nullable_to_non_nullable
                      as NickName,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as Email,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as Name,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as Name,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as Age,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as Weight,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as Height,
            birthDate: null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
    @UserIdConverter() UserId id,
    @JsonKey(name: 'nick_name') @NickNameConverter() NickName nickName,
    @EmailConverter() Email email,
    @JsonKey(name: 'first_name') @NameConverter() Name firstName,
    @JsonKey(name: 'last_name') @NameConverter() Name lastName,
    @AgeConverter() Age age,
    @WeightConverter() Weight weight,
    @HeightConverter() Height height,
    @JsonKey(name: 'birth_date') @_DateTimeConverter() DateTime birthDate,
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
    Object? firstName = null,
    Object? lastName = null,
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
                  as UserId,
        nickName: null == nickName
            ? _value.nickName
            : nickName // ignore: cast_nullable_to_non_nullable
                  as NickName,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as Email,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as Name,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as Name,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as Age,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as Weight,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as Height,
        birthDate: null == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    @UserIdConverter() required this.id,
    @JsonKey(name: 'nick_name') @NickNameConverter() required this.nickName,
    @EmailConverter() required this.email,
    @JsonKey(name: 'first_name') @NameConverter() required this.firstName,
    @JsonKey(name: 'last_name') @NameConverter() required this.lastName,
    @AgeConverter() required this.age,
    @WeightConverter() required this.weight,
    @HeightConverter() required this.height,
    @JsonKey(name: 'birth_date') @_DateTimeConverter() required this.birthDate,
  });

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @UserIdConverter()
  final UserId id;
  @override
  @JsonKey(name: 'nick_name')
  @NickNameConverter()
  final NickName nickName;
  @override
  @EmailConverter()
  final Email email;
  @override
  @JsonKey(name: 'first_name')
  @NameConverter()
  final Name firstName;
  @override
  @JsonKey(name: 'last_name')
  @NameConverter()
  final Name lastName;
  @override
  @AgeConverter()
  final Age age;
  @override
  @WeightConverter()
  final Weight weight;
  @override
  @HeightConverter()
  final Height height;
  @override
  @JsonKey(name: 'birth_date')
  @_DateTimeConverter()
  final DateTime birthDate;

  @override
  String toString() {
    return 'UserProfile(id: $id, nickName: $nickName, email: $email, firstName: $firstName, lastName: $lastName, age: $age, weight: $weight, height: $height, birthDate: $birthDate)';
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
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
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
    firstName,
    lastName,
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
    @UserIdConverter() required final UserId id,
    @JsonKey(name: 'nick_name')
    @NickNameConverter()
    required final NickName nickName,
    @EmailConverter() required final Email email,
    @JsonKey(name: 'first_name') @NameConverter() required final Name firstName,
    @JsonKey(name: 'last_name') @NameConverter() required final Name lastName,
    @AgeConverter() required final Age age,
    @WeightConverter() required final Weight weight,
    @HeightConverter() required final Height height,
    @JsonKey(name: 'birth_date')
    @_DateTimeConverter()
    required final DateTime birthDate,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  @UserIdConverter()
  UserId get id;
  @override
  @JsonKey(name: 'nick_name')
  @NickNameConverter()
  NickName get nickName;
  @override
  @EmailConverter()
  Email get email;
  @override
  @JsonKey(name: 'first_name')
  @NameConverter()
  Name get firstName;
  @override
  @JsonKey(name: 'last_name')
  @NameConverter()
  Name get lastName;
  @override
  @AgeConverter()
  Age get age;
  @override
  @WeightConverter()
  Weight get weight;
  @override
  @HeightConverter()
  Height get height;
  @override
  @JsonKey(name: 'birth_date')
  @_DateTimeConverter()
  DateTime get birthDate;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
