import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise.dart';
import 'repeated.dart';

part 'workout_program.freezed.dart';

@freezed
class WorkoutProgram with _$WorkoutProgram {
  const factory WorkoutProgram({
    required int id,
    required String title, // В Go это Name
    String? description, // Стало необязательным
    double? rating,      // Для дизайна
    String? trainerName, // Для дизайна
    required List<ExerciserInProgram> exercises, // Список упражнений с планом
  }) = _WorkoutProgram;
}

@freezed
class ExerciserInProgram with _$ExerciserInProgram {
  const factory ExerciserInProgram({
    required int id,
    required String name,
    required String description,
    required String image,
    required List<Repeated> repeats, // Сколько подходов и с каким весом
  }) = _ExerciserInProgram;
}