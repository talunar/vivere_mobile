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

WorkoutProgram _$WorkoutProgramFromJson(Map<String, dynamic> json) {
  return _WorkoutProgram.fromJson(json);
}

/// @nodoc
mixin _$WorkoutProgram {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  String get trainerName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;

  /// Serializes this WorkoutProgram to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
    String id,
    String title,
    double rating,
    List<Exercise> exercises,
    String trainerName,
    String imageUrl,
    bool isVisible,
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
    Object? rating = null,
    Object? exercises = null,
    Object? trainerName = null,
    Object? imageUrl = null,
    Object? isVisible = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<Exercise>,
            trainerName: null == trainerName
                ? _value.trainerName
                : trainerName // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            isVisible: null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
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
    String id,
    String title,
    double rating,
    List<Exercise> exercises,
    String trainerName,
    String imageUrl,
    bool isVisible,
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
    Object? rating = null,
    Object? exercises = null,
    Object? trainerName = null,
    Object? imageUrl = null,
    Object? isVisible = null,
  }) {
    return _then(
      _$WorkoutProgramImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<Exercise>,
        trainerName: null == trainerName
            ? _value.trainerName
            : trainerName // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        isVisible: null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutProgramImpl implements _WorkoutProgram {
  const _$WorkoutProgramImpl({
    required this.id,
    required this.title,
    required this.rating,
    required final List<Exercise> exercises,
    required this.trainerName,
    required this.imageUrl,
    this.isVisible = true,
  }) : _exercises = exercises;

  factory _$WorkoutProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutProgramImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double rating;
  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final String trainerName;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final bool isVisible;

  @override
  String toString() {
    return 'WorkoutProgram(id: $id, title: $title, rating: $rating, exercises: $exercises, trainerName: $trainerName, imageUrl: $imageUrl, isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.trainerName, trainerName) ||
                other.trainerName == trainerName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    rating,
    const DeepCollectionEquality().hash(_exercises),
    trainerName,
    imageUrl,
    isVisible,
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

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutProgramImplToJson(this);
  }
}

abstract class _WorkoutProgram implements WorkoutProgram {
  const factory _WorkoutProgram({
    required final String id,
    required final String title,
    required final double rating,
    required final List<Exercise> exercises,
    required final String trainerName,
    required final String imageUrl,
    final bool isVisible,
  }) = _$WorkoutProgramImpl;

  factory _WorkoutProgram.fromJson(Map<String, dynamic> json) =
      _$WorkoutProgramImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get rating;
  @override
  List<Exercise> get exercises;
  @override
  String get trainerName;
  @override
  String get imageUrl;
  @override
  bool get isVisible;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
