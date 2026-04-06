import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise.dart';

part 'workout_program.freezed.dart';
part 'workout_program.g.dart';

@freezed
class WorkoutProgram with _$WorkoutProgram {
  const factory WorkoutProgram({
    required String id,
    required String title,
    required double rating,
    required List<Exercise> exercises,
    required String trainerName,
    required String imageUrl,
    @Default(true) bool isVisible,
  }) = _WorkoutProgram;

  factory WorkoutProgram.fromJson(Map<String, dynamic> json) => _$WorkoutProgramFromJson(json);
}