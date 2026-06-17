import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../models/workout_dto.dart';
import 'repeated_mapper.dart';

extension CategoryDtoX on CategoryDto {
  /// Маппинг категории. Если программ нет — возвращаем пустой список, не падаем.
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
  /// Собираем упражнения. 
  /// Если бэкенд прислал null в списке воркаутов или упражнений, 
  /// мы все равно вернем валидный объект WorkoutProgram.
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
      trainerName: 'Vivere Team', // Дефолт, если бэкенд не прислал тренера
      exercises: allExercises,
    );
  }
}

extension ExerciserDtoX on ExerciserDto {
  /// Маппинг упражнения. 
  /// Если список повторов (repeats) пуст, мы создаем один дефолтный подход.
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
