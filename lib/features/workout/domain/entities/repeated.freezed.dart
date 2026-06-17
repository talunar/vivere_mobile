// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Repeated {
  int get id => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;

  /// Create a copy of Repeated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepeatedCopyWith<Repeated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatedCopyWith<$Res> {
  factory $RepeatedCopyWith(Repeated value, $Res Function(Repeated) then) =
      _$RepeatedCopyWithImpl<$Res, Repeated>;
  @useResult
  $Res call({int id, int weight, int reps, int seconds});
}

/// @nodoc
class _$RepeatedCopyWithImpl<$Res, $Val extends Repeated>
    implements $RepeatedCopyWith<$Res> {
  _$RepeatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Repeated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? reps = null,
    Object? seconds = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int,
            seconds: null == seconds
                ? _value.seconds
                : seconds // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RepeatedImplCopyWith<$Res>
    implements $RepeatedCopyWith<$Res> {
  factory _$$RepeatedImplCopyWith(
    _$RepeatedImpl value,
    $Res Function(_$RepeatedImpl) then,
  ) = __$$RepeatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int weight, int reps, int seconds});
}

/// @nodoc
class __$$RepeatedImplCopyWithImpl<$Res>
    extends _$RepeatedCopyWithImpl<$Res, _$RepeatedImpl>
    implements _$$RepeatedImplCopyWith<$Res> {
  __$$RepeatedImplCopyWithImpl(
    _$RepeatedImpl _value,
    $Res Function(_$RepeatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Repeated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? reps = null,
    Object? seconds = null,
  }) {
    return _then(
      _$RepeatedImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
        seconds: null == seconds
            ? _value.seconds
            : seconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RepeatedImpl extends _Repeated {
  const _$RepeatedImpl({
    required this.id,
    required this.weight,
    this.reps = 20,
    this.seconds = 60,
  }) : super._();

  @override
  final int id;
  @override
  final int weight;
  @override
  @JsonKey()
  final int reps;
  @override
  @JsonKey()
  final int seconds;

  @override
  String toString() {
    return 'Repeated(id: $id, weight: $weight, reps: $reps, seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, weight, reps, seconds);

  /// Create a copy of Repeated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatedImplCopyWith<_$RepeatedImpl> get copyWith =>
      __$$RepeatedImplCopyWithImpl<_$RepeatedImpl>(this, _$identity);
}

abstract class _Repeated extends Repeated {
  const factory _Repeated({
    required final int id,
    required final int weight,
    final int reps,
    final int seconds,
  }) = _$RepeatedImpl;
  const _Repeated._() : super._();

  @override
  int get id;
  @override
  int get weight;
  @override
  int get reps;
  @override
  int get seconds;

  /// Create a copy of Repeated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepeatedImplCopyWith<_$RepeatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
