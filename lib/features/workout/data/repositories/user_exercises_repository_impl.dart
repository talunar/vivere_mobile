import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_user_exercises_repository.dart';
import '../sources/i_user_exercises_data_source.dart';
import '../mappers/workout_mapper.dart';
import '../models/workout_dto.dart';
import '../mappers/repeated_mapper.dart';

class UserExercisesRepositoryImpl implements IUserExercisesRepository {
  final IUserExercisesDataSource _dataSource;

  UserExercisesRepositoryImpl(this._dataSource);

  @override
  Future<List<ExerciserInProgram>> getUserExercises(int userId) async {
    final dtos = await _dataSource.getUserExercises(userId);
    return dtos.map((dto) => dto.toInProgramEntity()).toList();
  }

  @override
  Future<void> addExercise(int userId, ExerciserInProgram exercise) async {
    final dto = ExerciserDto(
      id: exercise.id,
      name: exercise.name,
      description: exercise.description,
      image: exercise.image,
      repeats: exercise.repeats.map((r) => r.toDto()).toList(),
    );
    await _dataSource.addExerciseForUser(userId, dto);
  }

  @override
  Future<void> deleteExercise(int exerciseId) async {
    await _dataSource.deleteExercise(exerciseId);
  }

  @override
  Future<void> updateExercise(ExerciserInProgram exercise) async {
    final dto = ExerciserDto(
      id: exercise.id,
      name: exercise.name,
      description: exercise.description,
      image: exercise.image,
      repeats: exercise.repeats.map((r) => r.toDto()).toList(),
    );

    await _dataSource.updateExercise(exercise.id, dto);
  }

  @override
  Future<WorkoutProgram?> getCurrentExercise(int userId) async {
    final dto = await _dataSource.getCurrentExercise(userId);
    if (dto == null) return null;

    final allExercises = <ExerciserInProgram>[];
    if (dto.workouts != null) {
      for (var workout in dto.workouts!) {
        if (workout.exercises != null) {
          allExercises.addAll(
            workout.exercises!.map((e) => e.toInProgramEntity()),
          );
        }
      }
    }

    return WorkoutProgram(
      id: dto.id,
      title: dto.name,
      description: dto.description,
      exercises: allExercises,
    );
  }

  @override
  Future<void> saveCurrentStep(int userId, int exerciseId, int stepIndex) async {
    print('Saving step: user $userId, program $exerciseId, step $stepIndex');
  }
}
