import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../models/workout_dto.dart';
import 'repeated_mapper.dart';

extension CategoryDtoX on CategoryDto {
  /// Маппинг категории и программ
  WorkoutCategory toDomain() {
    return WorkoutCategory(
      id: id,
      name: name,
      image: image,
      description: null,
      programs: programs?.map((p) => p.toDomain()).toList() ?? [],
    );
  }
}

extension ProgramDtoX on ProgramDto {
  /// Маппинг программы. Собирает все упражнения из вложенных воркаутов в один плоский список.
  WorkoutProgram toDomain() {
    final allExercises = <ExerciserInProgram>[];
    
    if (workouts != null) {
      for (var workout in workouts!) {
        if (workout.exercises != null) {
          allExercises.addAll(
            workout.exercises!.map((e) => e.toInProgramEntity()),
          );
        }
      }
    }

    return WorkoutProgram(
      id: id,
      title: name,
      description: description,
      rating: null,
      trainerName: null,
      exercises: allExercises,
    );
  }
}

extension ExerciserDtoX on ExerciserDto {
  /// Маппинг для экрана выполнения упражнения
  ExerciserInProgram toInProgramEntity() {
    return ExerciserInProgram(
      id: id,
      name: name,
      description: description,
      image: image,
      repeats: repeats?.map((r) => r.toDomain()).toList() ?? [],
    );
  }
}