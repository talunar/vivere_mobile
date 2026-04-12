// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutSession {
  String get id => throw _privateConstructorUsedError;
  int get programId =>
      throw _privateConstructorUsedError; // К какой программе относится сессия
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  List<ExerciseResult> get results => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionCopyWith<WorkoutSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionCopyWith<$Res> {
  factory $WorkoutSessionCopyWith(
    WorkoutSession value,
    $Res Function(WorkoutSession) then,
  ) = _$WorkoutSessionCopyWithImpl<$Res, WorkoutSession>;
  @useResult
  $Res call({
    String id,
    int programId,
    DateTime startTime,
    DateTime? endTime,
    List<ExerciseResult> results,
  });
}

/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res, $Val extends WorkoutSession>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? programId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? results = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            programId: null == programId
                ? _value.programId
                : programId // ignore: cast_nullable_to_non_nullable
                      as int,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseResult>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionImplCopyWith<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  factory _$$WorkoutSessionImplCopyWith(
    _$WorkoutSessionImpl value,
    $Res Function(_$WorkoutSessionImpl) then,
  ) = __$$WorkoutSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int programId,
    DateTime startTime,
    DateTime? endTime,
    List<ExerciseResult> results,
  });
}

/// @nodoc
class __$$WorkoutSessionImplCopyWithImpl<$Res>
    extends _$WorkoutSessionCopyWithImpl<$Res, _$WorkoutSessionImpl>
    implements _$$WorkoutSessionImplCopyWith<$Res> {
  __$$WorkoutSessionImplCopyWithImpl(
    _$WorkoutSessionImpl _value,
    $Res Function(_$WorkoutSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? programId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? results = null,
  }) {
    return _then(
      _$WorkoutSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        programId: null == programId
            ? _value.programId
            : programId // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseResult>,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutSessionImpl implements _WorkoutSession {
  const _$WorkoutSessionImpl({
    required this.id,
    required this.programId,
    required this.startTime,
    this.endTime,
    required final List<ExerciseResult> results,
  }) : _results = results;

  @override
  final String id;
  @override
  final int programId;
  // К какой программе относится сессия
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  final List<ExerciseResult> _results;
  @override
  List<ExerciseResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'WorkoutSession(id: $id, programId: $programId, startTime: $startTime, endTime: $endTime, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    programId,
    startTime,
    endTime,
    const DeepCollectionEquality().hash(_results),
  );

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      __$$WorkoutSessionImplCopyWithImpl<_$WorkoutSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutSession implements WorkoutSession {
  const factory _WorkoutSession({
    required final String id,
    required final int programId,
    required final DateTime startTime,
    final DateTime? endTime,
    required final List<ExerciseResult> results,
  }) = _$WorkoutSessionImpl;

  @override
  String get id;
  @override
  int get programId; // К какой программе относится сессия
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  List<ExerciseResult> get results;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseResult {
  int get exerciseId => throw _privateConstructorUsedError;
  List<SetRecord> get sets => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseResultCopyWith<ExerciseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseResultCopyWith<$Res> {
  factory $ExerciseResultCopyWith(
    ExerciseResult value,
    $Res Function(ExerciseResult) then,
  ) = _$ExerciseResultCopyWithImpl<$Res, ExerciseResult>;
  @useResult
  $Res call({int exerciseId, List<SetRecord> sets});
}

/// @nodoc
class _$ExerciseResultCopyWithImpl<$Res, $Val extends ExerciseResult>
    implements $ExerciseResultCopyWith<$Res> {
  _$ExerciseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exerciseId = null, Object? sets = null}) {
    return _then(
      _value.copyWith(
            exerciseId: null == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as int,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as List<SetRecord>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseResultImplCopyWith<$Res>
    implements $ExerciseResultCopyWith<$Res> {
  factory _$$ExerciseResultImplCopyWith(
    _$ExerciseResultImpl value,
    $Res Function(_$ExerciseResultImpl) then,
  ) = __$$ExerciseResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int exerciseId, List<SetRecord> sets});
}

/// @nodoc
class __$$ExerciseResultImplCopyWithImpl<$Res>
    extends _$ExerciseResultCopyWithImpl<$Res, _$ExerciseResultImpl>
    implements _$$ExerciseResultImplCopyWith<$Res> {
  __$$ExerciseResultImplCopyWithImpl(
    _$ExerciseResultImpl _value,
    $Res Function(_$ExerciseResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exerciseId = null, Object? sets = null}) {
    return _then(
      _$ExerciseResultImpl(
        exerciseId: null == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as int,
        sets: null == sets
            ? _value._sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as List<SetRecord>,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseResultImpl implements _ExerciseResult {
  const _$ExerciseResultImpl({
    required this.exerciseId,
    required final List<SetRecord> sets,
  }) : _sets = sets;

  @override
  final int exerciseId;
  final List<SetRecord> _sets;
  @override
  List<SetRecord> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'ExerciseResult(exerciseId: $exerciseId, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseResultImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    const DeepCollectionEquality().hash(_sets),
  );

  /// Create a copy of ExerciseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseResultImplCopyWith<_$ExerciseResultImpl> get copyWith =>
      __$$ExerciseResultImplCopyWithImpl<_$ExerciseResultImpl>(
        this,
        _$identity,
      );
}

abstract class _ExerciseResult implements ExerciseResult {
  const factory _ExerciseResult({
    required final int exerciseId,
    required final List<SetRecord> sets,
  }) = _$ExerciseResultImpl;

  @override
  int get exerciseId;
  @override
  List<SetRecord> get sets;

  /// Create a copy of ExerciseResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseResultImplCopyWith<_$ExerciseResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SetRecord {
  int get weight => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;

  /// Create a copy of SetRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetRecordCopyWith<SetRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetRecordCopyWith<$Res> {
  factory $SetRecordCopyWith(SetRecord value, $Res Function(SetRecord) then) =
      _$SetRecordCopyWithImpl<$Res, SetRecord>;
  @useResult
  $Res call({int weight, int reps});
}

/// @nodoc
class _$SetRecordCopyWithImpl<$Res, $Val extends SetRecord>
    implements $SetRecordCopyWith<$Res> {
  _$SetRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? weight = null, Object? reps = null}) {
    return _then(
      _value.copyWith(
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SetRecordImplCopyWith<$Res>
    implements $SetRecordCopyWith<$Res> {
  factory _$$SetRecordImplCopyWith(
    _$SetRecordImpl value,
    $Res Function(_$SetRecordImpl) then,
  ) = __$$SetRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int weight, int reps});
}

/// @nodoc
class __$$SetRecordImplCopyWithImpl<$Res>
    extends _$SetRecordCopyWithImpl<$Res, _$SetRecordImpl>
    implements _$$SetRecordImplCopyWith<$Res> {
  __$$SetRecordImplCopyWithImpl(
    _$SetRecordImpl _value,
    $Res Function(_$SetRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? weight = null, Object? reps = null}) {
    return _then(
      _$SetRecordImpl(
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SetRecordImpl implements _SetRecord {
  const _$SetRecordImpl({required this.weight, required this.reps});

  @override
  final int weight;
  @override
  final int reps;

  @override
  String toString() {
    return 'SetRecord(weight: $weight, reps: $reps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetRecordImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.reps, reps) || other.reps == reps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weight, reps);

  /// Create a copy of SetRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetRecordImplCopyWith<_$SetRecordImpl> get copyWith =>
      __$$SetRecordImplCopyWithImpl<_$SetRecordImpl>(this, _$identity);
}

abstract class _SetRecord implements SetRecord {
  const factory _SetRecord({
    required final int weight,
    required final int reps,
  }) = _$SetRecordImpl;

  @override
  int get weight;
  @override
  int get reps;

  /// Create a copy of SetRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetRecordImplCopyWith<_$SetRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
