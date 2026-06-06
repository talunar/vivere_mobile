import 'package:vivere_mobile/features/workout/domain/entities/workout_program.dart';

abstract class IUserExercisesRepository {
  Future<List<ExerciserInProgram>> getUserExercises(int userId);
  Future<void> addExercise(int userId, ExerciserInProgram exercise);
  Future<void> deleteExercise(int exerciseId);
  Future<void> updateExercise(ExerciserInProgram exercise);
  
  /// Получение текущего активного упражнения/тренировки с бэкенда
  Future<WorkoutProgram?> getCurrentExercise(int userId);
  
  /// Сохранение текущего шага тренировки
  Future<void> saveCurrentStep(int userId, int exerciseId, int stepIndex);
}
