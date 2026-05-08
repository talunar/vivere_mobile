import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_user_exercises_repository.dart';
import '../mappers/workout_mapper.dart';
import '../sources/user_exercises_mock_data_source.dart';

class UserExercisesRepositoryImpl implements IUserExercisesRepository {
  final UserExercisesMockDataSource _dataSource;

  UserExercisesRepositoryImpl(this._dataSource);

  @override
  Future<List<ExerciserInProgram>> getUserExercises(int userId) async {
    final dtos = await _dataSource.getUserExercises(userId);
    return dtos.map((e) => e.toInProgramEntity()).toList();
  }

  @override
  Future<void> addExercise(int userId, ExerciserInProgram exercise) async {
    // await _dataSource.addExerciseForUser(userId, exerciseDto);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteExercise(int exerciseId) async {
    await _dataSource.deleteExercise(exerciseId);
  }
}
