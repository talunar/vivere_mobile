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

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return _CategoryDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<ExerciseDto> get exercises => throw _privateConstructorUsedError;

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
  $Res call({int id, String name, String image, List<ExerciseDto> exercises});
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
    Object? exercises = null,
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
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseDto>,
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
  $Res call({int id, String name, String image, List<ExerciseDto> exercises});
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
    Object? exercises = null,
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
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDtoImpl implements _CategoryDto {
  const _$CategoryDtoImpl({
    required this.id,
    required this.name,
    required this.image,
    required final List<ExerciseDto> exercises,
  }) : _exercises = exercises;

  factory _$CategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  final List<ExerciseDto> _exercises;
  @override
  List<ExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'CategoryDto(id: $id, name: $name, image: $image, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
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
    image,
    const DeepCollectionEquality().hash(_exercises),
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
    required final List<ExerciseDto> exercises,
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
  List<ExerciseDto> get exercises;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) {
  return _ExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$ExerciseDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'workouts')
  List<ProgramDto>? get programs => throw _privateConstructorUsedError;

  /// Serializes this ExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseDtoCopyWith<ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDtoCopyWith<$Res> {
  factory $ExerciseDtoCopyWith(
    ExerciseDto value,
    $Res Function(ExerciseDto) then,
  ) = _$ExerciseDtoCopyWithImpl<$Res, ExerciseDto>;
  @useResult
  $Res call({
    int id,
    String name,
    String image,
    String description,
    @JsonKey(name: 'workouts') List<ProgramDto>? programs,
  });
}

/// @nodoc
class _$ExerciseDtoCopyWithImpl<$Res, $Val extends ExerciseDto>
    implements $ExerciseDtoCopyWith<$Res> {
  _$ExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? description = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ExerciseDtoImplCopyWith<$Res>
    implements $ExerciseDtoCopyWith<$Res> {
  factory _$$ExerciseDtoImplCopyWith(
    _$ExerciseDtoImpl value,
    $Res Function(_$ExerciseDtoImpl) then,
  ) = __$$ExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String image,
    String description,
    @JsonKey(name: 'workouts') List<ProgramDto>? programs,
  });
}

/// @nodoc
class __$$ExerciseDtoImplCopyWithImpl<$Res>
    extends _$ExerciseDtoCopyWithImpl<$Res, _$ExerciseDtoImpl>
    implements _$$ExerciseDtoImplCopyWith<$Res> {
  __$$ExerciseDtoImplCopyWithImpl(
    _$ExerciseDtoImpl _value,
    $Res Function(_$ExerciseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? description = null,
    Object? programs = freezed,
  }) {
    return _then(
      _$ExerciseDtoImpl(
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
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$ExerciseDtoImpl implements _ExerciseDto {
  const _$ExerciseDtoImpl({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    @JsonKey(name: 'workouts') final List<ProgramDto>? programs,
  }) : _programs = programs;

  factory _$ExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String description;
  final List<ProgramDto>? _programs;
  @override
  @JsonKey(name: 'workouts')
  List<ProgramDto>? get programs {
    final value = _programs;
    if (value == null) return null;
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExerciseDto(id: $id, name: $name, image: $image, description: $description, programs: $programs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    image,
    description,
    const DeepCollectionEquality().hash(_programs),
  );

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseDtoImplCopyWith<_$ExerciseDtoImpl> get copyWith =>
      __$$ExerciseDtoImplCopyWithImpl<_$ExerciseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseDtoImplToJson(this);
  }
}

abstract class _ExerciseDto implements ExerciseDto {
  const factory _ExerciseDto({
    required final int id,
    required final String name,
    required final String image,
    required final String description,
    @JsonKey(name: 'workouts') final List<ProgramDto>? programs,
  }) = _$ExerciseDtoImpl;

  factory _ExerciseDto.fromJson(Map<String, dynamic> json) =
      _$ExerciseDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  String get description;
  @override
  @JsonKey(name: 'workouts')
  List<ProgramDto>? get programs;

  /// Create a copy of ExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseDtoImplCopyWith<_$ExerciseDtoImpl> get copyWith =>
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
  $Res call({int id, String name, String description});
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
  $Res call({int id, String name, String description});
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramDtoImpl implements _ProgramDto {
  const _$ProgramDtoImpl({
    required this.id,
    required this.name,
    required this.description,
  });

  factory _$ProgramDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'ProgramDto(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

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
  }) = _$ProgramDtoImpl;

  factory _ProgramDto.fromJson(Map<String, dynamic> json) =
      _$ProgramDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of ProgramDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramDtoImplCopyWith<_$ProgramDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
