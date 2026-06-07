import '../models/workout_dto.dart';

abstract class IUserExercisesDataSource {
  Future<List<ExerciserDto>> getUserExercises(int userId);
  Future<ProgramDto?> getCurrentExercise(int userId);
  Future<void> addExerciseForUser(int userId, ExerciserDto exercise);
  Future<void> updateExercise(int exerciseId, ExerciserDto exercise);
  Future<void> deleteExercise(int exerciseId);
}
