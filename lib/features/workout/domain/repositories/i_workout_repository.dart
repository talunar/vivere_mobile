import '../entities/workout_category.dart';
import '../entities/workout_program.dart';

abstract class IWorkoutRepository {
  /// Получение списка категорий с поддержкой пагинации
  Future<List<WorkoutCategory>> getCategories({int limit = 10, int offset = 0}); 
  
  Future<WorkoutCategory> getCategory(int id);
  
  /// Получение программ категории с поддержкой пагинации
  Future<List<WorkoutProgram>> getProgramsByCategory(
    int categoryId, {
    int limit = 10, 
    int offset = 0,
  });
  
  Future<WorkoutProgram> getProgramDetails(int programId);
}
