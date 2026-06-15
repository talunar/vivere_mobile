import '../models/workout_dto.dart';
import 'i_user_exercises_data_source.dart';

class UserExercisesMockDataSource implements IUserExercisesDataSource {
  static final List<ExerciserDto> _userExercises = [];

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 500));

  @override
  Future<List<ExerciserDto>> getUserExercises(int userId) async {
    await _delay();
    return List.from(_userExercises);
  }

  @override
  Future<ProgramDto?> getCurrentExercise(int userId) async {
    await _delay();
    return null;
  }

  @override
  Future<void> addExerciseForUser(int userId, ExerciserDto exercise) async {
    await _delay();
    if (!_userExercises.any((e) => e.id == exercise.id)) {
      _userExercises.add(exercise);
    }
  }

  @override
  Future<void> deleteExercise(int exerciseId) async {
    await _delay();
    _userExercises.removeWhere((e) => e.id == exerciseId);
  }

  @override
  Future<void> updateExercise(int exerciseId, ExerciserDto exercise) async {
    await _delay();
    final index = _userExercises.indexWhere((e) => e.id == exerciseId);
    if (index != -1) {
      _userExercises[index] = exercise;
    }
  }
}
