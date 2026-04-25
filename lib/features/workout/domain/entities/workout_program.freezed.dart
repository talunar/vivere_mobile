// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutProgram {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError; // В Go это Name
  String? get description =>
      throw _privateConstructorUsedError; // Стало необязательным
  double? get rating => throw _privateConstructorUsedError; // Для дизайна
  String? get trainerName => throw _privateConstructorUsedError; // Для дизайна
  List<ExerciserInProgram> get exercises => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutProgramCopyWith<WorkoutProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutProgramCopyWith<$Res> {
  factory $WorkoutProgramCopyWith(
    WorkoutProgram value,
    $Res Function(WorkoutProgram) then,
  ) = _$WorkoutProgramCopyWithImpl<$Res, WorkoutProgram>;
  @useResult
  $Res call({
    int id,
    String title,
    String? description,
    double? rating,
    String? trainerName,
    List<ExerciserInProgram> exercises,
  });
}

/// @nodoc
class _$WorkoutProgramCopyWithImpl<$Res, $Val extends WorkoutProgram>
    implements $WorkoutProgramCopyWith<$Res> {
  _$WorkoutProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? rating = freezed,
    Object? trainerName = freezed,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            trainerName: freezed == trainerName
                ? _value.trainerName
                : trainerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<ExerciserInProgram>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutProgramImplCopyWith<$Res>
    implements $WorkoutProgramCopyWith<$Res> {
  factory _$$WorkoutProgramImplCopyWith(
    _$WorkoutProgramImpl value,
    $Res Function(_$WorkoutProgramImpl) then,
  ) = __$$WorkoutProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String? description,
    double? rating,
    String? trainerName,
    List<ExerciserInProgram> exercises,
  });
}

/// @nodoc
class __$$WorkoutProgramImplCopyWithImpl<$Res>
    extends _$WorkoutProgramCopyWithImpl<$Res, _$WorkoutProgramImpl>
    implements _$$WorkoutProgramImplCopyWith<$Res> {
  __$$WorkoutProgramImplCopyWithImpl(
    _$WorkoutProgramImpl _value,
    $Res Function(_$WorkoutProgramImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? rating = freezed,
    Object? trainerName = freezed,
    Object? exercises = null,
  }) {
    return _then(
      _$WorkoutProgramImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        trainerName: freezed == trainerName
            ? _value.trainerName
            : trainerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<ExerciserInProgram>,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutProgramImpl implements _WorkoutProgram {
  const _$WorkoutProgramImpl({
    required this.id,
    required this.title,
    this.description,
    this.rating,
    this.trainerName,
    required final List<ExerciserInProgram> exercises,
  }) : _exercises = exercises;

  @override
  final int id;
  @override
  final String title;
  // В Go это Name
  @override
  final String? description;
  // Стало необязательным
  @override
  final double? rating;
  // Для дизайна
  @override
  final String? trainerName;
  // Для дизайна
  final List<ExerciserInProgram> _exercises;
  // Для дизайна
  @override
  List<ExerciserInProgram> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutProgram(id: $id, title: $title, description: $description, rating: $rating, trainerName: $trainerName, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.trainerName, trainerName) ||
                other.trainerName == trainerName) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    rating,
    trainerName,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      __$$WorkoutProgramImplCopyWithImpl<_$WorkoutProgramImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutProgram implements WorkoutProgram {
  const factory _WorkoutProgram({
    required final int id,
    required final String title,
    final String? description,
    final double? rating,
    final String? trainerName,
    required final List<ExerciserInProgram> exercises,
  }) = _$WorkoutProgramImpl;

  @override
  int get id;
  @override
  String get title; // В Go это Name
  @override
  String? get description; // Стало необязательным
  @override
  double? get rating; // Для дизайна
  @override
  String? get trainerName; // Для дизайна
  @override
  List<ExerciserInProgram> get exercises;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciserInProgram {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<Repeated> get repeats => throw _privateConstructorUsedError;

  /// Create a copy of ExerciserInProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciserInProgramCopyWith<ExerciserInProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciserInProgramCopyWith<$Res> {
  factory $ExerciserInProgramCopyWith(
    ExerciserInProgram value,
    $Res Function(ExerciserInProgram) then,
  ) = _$ExerciserInProgramCopyWithImpl<$Res, ExerciserInProgram>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String image,
    List<Repeated> repeats,
  });
}

/// @nodoc
class _$ExerciserInProgramCopyWithImpl<$Res, $Val extends ExerciserInProgram>
    implements $ExerciserInProgramCopyWith<$Res> {
  _$ExerciserInProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciserInProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? repeats = null,
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
            repeats: null == repeats
                ? _value.repeats
                : repeats // ignore: cast_nullable_to_non_nullable
                      as List<Repeated>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciserInProgramImplCopyWith<$Res>
    implements $ExerciserInProgramCopyWith<$Res> {
  factory _$$ExerciserInProgramImplCopyWith(
    _$ExerciserInProgramImpl value,
    $Res Function(_$ExerciserInProgramImpl) then,
  ) = __$$ExerciserInProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String image,
    List<Repeated> repeats,
  });
}

/// @nodoc
class __$$ExerciserInProgramImplCopyWithImpl<$Res>
    extends _$ExerciserInProgramCopyWithImpl<$Res, _$ExerciserInProgramImpl>
    implements _$$ExerciserInProgramImplCopyWith<$Res> {
  __$$ExerciserInProgramImplCopyWithImpl(
    _$ExerciserInProgramImpl _value,
    $Res Function(_$ExerciserInProgramImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciserInProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? repeats = null,
  }) {
    return _then(
      _$ExerciserInProgramImpl(
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
        repeats: null == repeats
            ? _value._repeats
            : repeats // ignore: cast_nullable_to_non_nullable
                  as List<Repeated>,
      ),
    );
  }
}

/// @nodoc

class _$ExerciserInProgramImpl implements _ExerciserInProgram {
  const _$ExerciserInProgramImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required final List<Repeated> repeats,
  }) : _repeats = repeats;

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  final List<Repeated> _repeats;
  @override
  List<Repeated> get repeats {
    if (_repeats is EqualUnmodifiableListView) return _repeats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repeats);
  }

  @override
  String toString() {
    return 'ExerciserInProgram(id: $id, name: $name, description: $description, image: $image, repeats: $repeats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciserInProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._repeats, _repeats));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    image,
    const DeepCollectionEquality().hash(_repeats),
  );

  /// Create a copy of ExerciserInProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciserInProgramImplCopyWith<_$ExerciserInProgramImpl> get copyWith =>
      __$$ExerciserInProgramImplCopyWithImpl<_$ExerciserInProgramImpl>(
        this,
        _$identity,
      );
}

abstract class _ExerciserInProgram implements ExerciserInProgram {
  const factory _ExerciserInProgram({
    required final int id,
    required final String name,
    required final String description,
    required final String image,
    required final List<Repeated> repeats,
  }) = _$ExerciserInProgramImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  List<Repeated> get repeats;

  /// Create a copy of ExerciserInProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciserInProgramImplCopyWith<_$ExerciserInProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
