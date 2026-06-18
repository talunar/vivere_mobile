import 'package:freezed_annotation/freezed_annotation.dart';
import 'repeated.dart';

part 'workout_program.freezed.dart';

@freezed
class WorkoutProgram with _$WorkoutProgram {
  const factory WorkoutProgram({
    required int id,
    required String title,
    String? description,
    double? rating,
    String? trainerName,
    String? trainerImage,
    String? image,
    String? level,
    String? equipment,
    int? durationMinutes,
    required List<ExerciserInProgram> exercises,
  }) = _WorkoutProgram;
}

@freezed
class ExerciserInProgram with _$ExerciserInProgram {
  const factory ExerciserInProgram({
    required int id,
    required String name,
    required String description,
    required String image,
    required List<Repeated> repeats,
    String? categoryImage,
  }) = _ExerciserInProgram;

  const ExerciserInProgram._();

  bool get isNetworkImage => image.startsWith('http');
}
