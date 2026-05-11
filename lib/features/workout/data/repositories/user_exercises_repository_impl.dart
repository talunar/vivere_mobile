import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_user_exercises_repository.dart';
import '../sources/user_exercises_mock_data_source.dart';
import '../mappers/workout_mapper.dart';
import '../models/workout_dto.dart';
import '../mappers/repeated_mapper.dart';

class UserExercisesRepositoryImpl implements IUserExercisesRepository {
  final UserExercisesMockDataSource _dataSource;

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

    await _dataSource.updateExercise(dto);
  }
}