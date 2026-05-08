import '../entities/workout_program.dart';

abstract class IUserExercisesRepository {
  Future<List<ExerciserInProgram>> getUserExercises(int userId);
  Future<void> addExercise(int userId, ExerciserInProgram exercise);
  Future<void> deleteExercise(int exerciseId); // Добавили метод удаления
}
