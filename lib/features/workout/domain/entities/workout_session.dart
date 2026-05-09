import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_session.freezed.dart';

@freezed
class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required String id,
    required int programId,
    required DateTime startTime,
    DateTime? endTime,
    required List<ExerciseResult> results,
  }) = _WorkoutSession;
}

@freezed
class ExerciseResult with _$ExerciseResult {
  const factory ExerciseResult({
    required int exerciseId,
    required List<SetRecord> sets,
  }) = _ExerciseResult;
}

@freezed
class SetRecord with _$SetRecord {
  const factory SetRecord({
    required int weight,
    required int reps,
  }) = _SetRecord;
}