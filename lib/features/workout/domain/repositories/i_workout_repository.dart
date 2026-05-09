import '../entities/workout_category.dart';
import '../entities/workout_program.dart';

abstract class IWorkoutRepository {
  Future<List<WorkoutCategory>> getCategories(); // Категории
  Future<WorkoutCategory> getCategory(int id);   // Категории и прокрутка
  Future<List<WorkoutProgram>> getProgramsByCategory(int categoryId); // Листинг программ
  Future<WorkoutProgram> getProgramDetails(int programId); // Полная информация о программе
}