import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../models/workout_dto.dart';
import 'repeated_mapper.dart';

extension CategoryDtoX on CategoryDto {
  /// Маппинг категории и 5 программ
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
  /// Маппинг экрана всех программ и программы тренировки
  WorkoutProgram toDomain() {
    return WorkoutProgram(
      id: id,
      title: name, // Мапим name из Go в title во Flutter
      description: description,
      rating: null,
      trainerName: null,
      exercises: exercises?.map((e) => e.toInProgramEntity()).toList() ?? [],
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