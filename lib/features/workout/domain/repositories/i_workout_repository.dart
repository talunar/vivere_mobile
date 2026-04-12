import '../entities/workout_category.dart';
import '../entities/exercise.dart';

abstract class IWorkoutRepository {
  // Получить одну категорию по ID
  Future<WorkoutCategory> getCategory(int id);

  // Получить список всех упражнений
  Future<List<Exercise>> getExercises();

// Можно добавить методы для программ и сессий
}