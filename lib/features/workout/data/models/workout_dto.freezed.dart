// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RepeatedDto _$RepeatedDtoFromJson(Map<String, dynamic> json) {
  return _RepeatedDto.fromJson(json);
}

/// @nodoc
mixin _$RepeatedDto {
  int get id => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  int? get reps => throw _privateConstructorUsedError;
  int? get seconds => throw _privateConstructorUsedError;

  /// Serializes this RepeatedDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepeatedDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepeatedDtoCopyWith<RepeatedDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatedDtoCopyWith<$Res> {
  factory $RepeatedDtoCopyWith(
    RepeatedDto value,
    $Res Function(RepeatedDto) then,
  ) = _$RepeatedDtoCopyWithImpl<$Res, RepeatedDto>;
  @useResult
  $Res call({int id, int weight, int? reps, int? seconds});
}

/// @nodoc
class _$RepeatedDtoCopyWithImpl<$Res, $Val extends RepeatedDto>
    implements $RepeatedDtoCopyWith<$Res> {
  _$RepeatedDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepeatedDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? reps = freezed,
    Object? seconds = freezed,
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
            reps: freezed == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int?,
            seconds: freezed == seconds
                ? _value.seconds
                : seconds // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RepeatedDtoImplCopyWith<$Res>
    implements $RepeatedDtoCopyWith<$Res> {
  factory _$$RepeatedDtoImplCopyWith(
    _$RepeatedDtoImpl value,
    $Res Function(_$RepeatedDtoImpl) then,
  ) = __$$RepeatedDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int weight, int? reps, int? seconds});
}

/// @nodoc
class __$$RepeatedDtoImplCopyWithImpl<$Res>
    extends _$RepeatedDtoCopyWithImpl<$Res, _$RepeatedDtoImpl>
    implements _$$RepeatedDtoImplCopyWith<$Res> {
  __$$RepeatedDtoImplCopyWithImpl(
    _$RepeatedDtoImpl _value,
    $Res Function(_$RepeatedDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RepeatedDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? reps = freezed,
    Object? seconds = freezed,
  }) {
    return _then(
      _$RepeatedDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: freezed == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int?,
        seconds: freezed == seconds
            ? _value.seconds
            : seconds // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RepeatedDtoImpl implements _RepeatedDto {
  const _$RepeatedDtoImpl({
    required this.id,
    required this.weight,
    this.reps,
    this.seconds,
  });

  factory _$RepeatedDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepeatedDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int weight;
  @override
  final int? reps;
  @override
  final int? seconds;

  @override
  String toString() {
    return 'RepeatedDto(id: $id, weight: $weight, reps: $reps, seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatedDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, weight, reps, seconds);

  /// Create a copy of RepeatedDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatedDtoImplCopyWith<_$RepeatedDtoImpl> get copyWith =>
      __$$RepeatedDtoImplCopyWithImpl<_$RepeatedDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepeatedDtoImplToJson(this);
  }
}

abstract class _RepeatedDto implements RepeatedDto {
  const factory _RepeatedDto({
    required final int id,
    required final int weight,
    final int? reps,
    final int? seconds,
  }) = _$RepeatedDtoImpl;

  factory _RepeatedDto.fromJson(Map<String, dynamic> json) =
      _$RepeatedDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get weight;
  @override
  int? get reps;
  @override
  int? get seconds;

  /// Create a copy of RepeatedDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepeatedDtoImplCopyWith<_$RepeatedDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciserDto _$ExerciserDtoFromJson(Map<String, dynamic> json) {
  return _ExerciserDto.fromJson(json);
}

/// @nodoc
mixin _$ExerciserDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<RepeatedDto>? get repeats => throw _privateConstructorUsedError;

  /// Serializes this ExerciserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciserDtoCopyWith<ExerciserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciserDtoCopyWith<$Res> {
  factory $ExerciserDtoCopyWith(
    ExerciserDto value,
    $Res Function(ExerciserDto) then,
  ) = _$ExerciserDtoCopyWithImpl<$Res, ExerciserDto>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String image,
    List<RepeatedDto>? repeats,
  });
}

/// @nodoc
class _$ExerciserDtoCopyWithImpl<$Res, $Val extends ExerciserDto>
    implements $ExerciserDtoCopyWith<$Res> {
  _$ExerciserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? repeats = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            repeats: freezed == repeats
                ? _value.repeats
                : repeats // ignore: cast_nullable_to_non_nullable
                      as List<RepeatedDto>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciserDtoImplCopyWith<$Res>
    implements $ExerciserDtoCopyWith<$Res> {
  factory _$$ExerciserDtoImplCopyWith(
    _$ExerciserDtoImpl value,
    $Res Function(_$ExerciserDtoImpl) then,
  ) = __$$ExerciserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String image,
    List<RepeatedDto>? repeats,
  });
}

/// @nodoc
class __$$ExerciserDtoImplCopyWithImpl<$Res>
    extends _$ExerciserDtoCopyWithImpl<$Res, _$ExerciserDtoImpl>
    implements _$$ExerciserDtoImplCopyWith<$Res> {
  __$$ExerciserDtoImplCopyWithImpl(
    _$ExerciserDtoImpl _value,
    $Res Function(_$ExerciserDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? repeats = freezed,
  }) {
    return _then(
      _$ExerciserDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        repeats: freezed == repeats
            ? _value._repeats
            : repeats // ignore: cast_nullable_to_non_nullable
                  as List<RepeatedDto>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ExerciserDtoImpl implements _ExerciserDto {
  const _$ExerciserDtoImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    final List<RepeatedDto>? repeats,
  }) : _repeats = repeats;

  factory _$ExerciserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciserDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  final List<RepeatedDto>? _repeats;
  @override
  List<RepeatedDto>? get repeats {
    final value = _repeats;
    if (value == null) return null;
    if (_repeats is EqualUnmodifiableListView) return _repeats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExerciserDto(id: $id, name: $name, description: $description, image: $image, repeats: $repeats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._repeats, _repeats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    image,
    const DeepCollectionEquality().hash(_repeats),
  );

  /// Create a copy of ExerciserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciserDtoImplCopyWith<_$ExerciserDtoImpl> get copyWith =>
      __$$ExerciserDtoImplCopyWithImpl<_$ExerciserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciserDtoImplToJson(this);
  }
}

abstract class _ExerciserDto implements ExerciserDto {
  const factory _ExerciserDto({
    required final int id,
    required final String name,
    required final String description,
    required final String image,
    final List<RepeatedDto>? repeats,
  }) = _$ExerciserDtoImpl;

  factory _ExerciserDto.fromJson(Map<String, dynamic> json) =
      _$ExerciserDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  List<RepeatedDto>? get repeats;

  /// Create a copy of ExerciserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciserDtoImplCopyWith<_$ExerciserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) {
  return _WorkoutDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercises')
  List<ExerciserDto>? get exercises => throw _privateConstructorUsedError;

  /// Serializes this WorkoutDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutDtoCopyWith<WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDtoCopyWith<$Res> {
  factory $WorkoutDtoCopyWith(
    WorkoutDto value,
    $Res Function(WorkoutDto) then,
  ) = _$WorkoutDtoCopyWithImpl<$Res, WorkoutDto>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    @JsonKey(name: 'exercises') List<ExerciserDto>? exercises,
  });
}

/// @nodoc
class _$WorkoutDtoCopyWithImpl<$Res, $Val extends WorkoutDto>
    implements $WorkoutDtoCopyWith<$Res> {
  _$WorkoutDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? exercises = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            exercises: freezed == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<ExerciserDto>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutDtoImplCopyWith<$Res>
    implements $WorkoutDtoCopyWith<$Res> {
  factory _$$WorkoutDtoImplCopyWith(
    _$WorkoutDtoImpl value,
    $Res Function(_$WorkoutDtoImpl) then,
  ) = __$$WorkoutDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    @JsonKey(name: 'exercises') List<ExerciserDto>? exercises,
  });
}

/// @nodoc
class __$$WorkoutDtoImplCopyWithImpl<$Res>
    extends _$WorkoutDtoCopyWithImpl<$Res, _$WorkoutDtoImpl>
    implements _$$WorkoutDtoImplCopyWith<$Res> {
  __$$WorkoutDtoImplCopyWithImpl(
    _$WorkoutDtoImpl _value,
    $Res Function(_$WorkoutDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? exercises = freezed,
  }) {
    return _then(
      _$WorkoutDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        exercises: freezed == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<ExerciserDto>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WorkoutDtoImpl implements _WorkoutDto {
  const _$WorkoutDtoImpl({
    required this.id,
    required this.name,
    required this.description,
    @JsonKey(name: 'exercises') final List<ExerciserDto>? exercises,
  }) : _exercises = exercises;

  factory _$WorkoutDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  final List<ExerciserDto>? _exercises;
  @override
  @JsonKey(name: 'exercises')
  List<ExerciserDto>? get exercises {
    final value = _exercises;
    if (value == null) return null;
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkoutDto(id: $id, name: $name, description: $description, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutDtoImplCopyWith<_$WorkoutDtoImpl> get copyWith =>
      __$$WorkoutDtoImplCopyWithImpl<_$WorkoutDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutDtoImplToJson(this);
  }
}

abstract class _WorkoutDto implements WorkoutDto {
  const factory _WorkoutDto({
    required final int id,
    required final String name,
    required final String description,
    @JsonKey(name: 'exercises') final List<ExerciserDto>? exercises,
  }) = _$WorkoutDtoImpl;

  factory _WorkoutDto.fromJson(Map<String, dynamic> json) =
      _$WorkoutDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'exercises')
  List<ExerciserDto>? get exercises;

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutDtoImplCopyWith<_$WorkoutDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProgramDto _$ProgramDtoFromJson(Map<String, dynamic> json) {
  return _ProgramDto.fromJson(json);
}

/// @nodoc
mixin _$ProgramDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'workouts')
  List<WorkoutDto>? get workouts => throw _privateConstructorUsedError;

  /// Serializes this ProgramDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgramDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramDtoCopyWith<ProgramDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramDtoCopyWith<$Res> {
  factory $ProgramDtoCopyWith(
    ProgramDto value,
    $Res Function(ProgramDto) then,
  ) = _$ProgramDtoCopyWithImpl<$Res, ProgramDto>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    @JsonKey(name: 'workouts') List<WorkoutDto>? workouts,
  });
}

/// @nodoc
class _$ProgramDtoCopyWithImpl<$Res, $Val extends ProgramDto>
    implements $ProgramDtoCopyWith<$Res> {
  _$ProgramDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? workouts = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            workouts: freezed == workouts
                ? _value.workouts
                : workouts // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutDto>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgramDtoImplCopyWith<$Res>
    implements $ProgramDtoCopyWith<$Res> {
  factory _$$ProgramDtoImplCopyWith(
    _$ProgramDtoImpl value,
    $Res Function(_$ProgramDtoImpl) then,
  ) = __$$ProgramDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    @JsonKey(name: 'workouts') List<WorkoutDto>? workouts,
  });
}

/// @nodoc
class __$$ProgramDtoImplCopyWithImpl<$Res>
    extends _$ProgramDtoCopyWithImpl<$Res, _$ProgramDtoImpl>
    implements _$$ProgramDtoImplCopyWith<$Res> {
  __$$ProgramDtoImplCopyWithImpl(
    _$ProgramDtoImpl _value,
    $Res Function(_$ProgramDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgramDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? workouts = freezed,
  }) {
    return _then(
      _$ProgramDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        workouts: freezed == workouts
            ? _value._workouts
            : workouts // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutDto>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProgramDtoImpl implements _ProgramDto {
  const _$ProgramDtoImpl({
    required this.id,
    required this.name,
    required this.description,
    @JsonKey(name: 'workouts') final List<WorkoutDto>? workouts,
  }) : _workouts = workouts;

  factory _$ProgramDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  final List<WorkoutDto>? _workouts;
  @override
  @JsonKey(name: 'workouts')
  List<WorkoutDto>? get workouts {
    final value = _workouts;
    if (value == null) return null;
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProgramDto(id: $id, name: $name, description: $description, workouts: $workouts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_workouts),
  );

  /// Create a copy of ProgramDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramDtoImplCopyWith<_$ProgramDtoImpl> get copyWith =>
      __$$ProgramDtoImplCopyWithImpl<_$ProgramDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramDtoImplToJson(this);
  }
}

abstract class _ProgramDto implements ProgramDto {
  const factory _ProgramDto({
    required final int id,
    required final String name,
    required final String description,
    @JsonKey(name: 'workouts') final List<WorkoutDto>? workouts,
  }) = _$ProgramDtoImpl;

  factory _ProgramDto.fromJson(Map<String, dynamic> json) =
      _$ProgramDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'workouts')
  List<WorkoutDto>? get workouts;

  /// Create a copy of ProgramDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramDtoImplCopyWith<_$ProgramDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return _CategoryDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercises')
  List<ProgramDto>? get programs => throw _privateConstructorUsedError;

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDtoCopyWith<CategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
    CategoryDto value,
    $Res Function(CategoryDto) then,
  ) = _$CategoryDtoCopyWithImpl<$Res, CategoryDto>;
  @useResult
  $Res call({
    int id,
    String name,
    String image,
    @JsonKey(name: 'exercises') List<ProgramDto>? programs,
  });
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res, $Val extends CategoryDto>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? programs = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            programs: freezed == programs
                ? _value.programs
                : programs // ignore: cast_nullable_to_non_nullable
                      as List<ProgramDto>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryDtoImplCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$$CategoryDtoImplCopyWith(
    _$CategoryDtoImpl value,
    $Res Function(_$CategoryDtoImpl) then,
  ) = __$$CategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String image,
    @JsonKey(name: 'exercises') List<ProgramDto>? programs,
  });
}

/// @nodoc
class __$$CategoryDtoImplCopyWithImpl<$Res>
    extends _$CategoryDtoCopyWithImpl<$Res, _$CategoryDtoImpl>
    implements _$$CategoryDtoImplCopyWith<$Res> {
  __$$CategoryDtoImplCopyWithImpl(
    _$CategoryDtoImpl _value,
    $Res Function(_$CategoryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? programs = freezed,
  }) {
    return _then(
      _$CategoryDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        programs: freezed == programs
            ? _value._programs
            : programs // ignore: cast_nullable_to_non_nullable
                  as List<ProgramDto>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CategoryDtoImpl implements _CategoryDto {
  const _$CategoryDtoImpl({
    required this.id,
    required this.name,
    required this.image,
    @JsonKey(name: 'exercises') final List<ProgramDto>? programs,
  }) : _programs = programs;

  factory _$CategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  final List<ProgramDto>? _programs;
  @override
  @JsonKey(name: 'exercises')
  List<ProgramDto>? get programs {
    final value = _programs;
    if (value == null) return null;
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryDto(id: $id, name: $name, image: $image, programs: $programs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    image,
    const DeepCollectionEquality().hash(_programs),
  );

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      __$$CategoryDtoImplCopyWithImpl<_$CategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDtoImplToJson(this);
  }
}

abstract class _CategoryDto implements CategoryDto {
  const factory _CategoryDto({
    required final int id,
    required final String name,
    required final String image,
    @JsonKey(name: 'exercises') final List<ProgramDto>? programs,
  }) = _$CategoryDtoImpl;

  factory _CategoryDto.fromJson(Map<String, dynamic> json) =
      _$CategoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(name: 'exercises')
  List<ProgramDto>? get programs;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
