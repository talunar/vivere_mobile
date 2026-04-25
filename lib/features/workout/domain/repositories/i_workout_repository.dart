import '../entities/workout_category.dart';
import '../entities/workout_program.dart';

abstract class IWorkoutRepository {
  Future<List<WorkoutCategory>> getCategories(); // Экран 1
  Future<WorkoutCategory> getCategory(int id);   // Экран 2 (с первыми программами)
  Future<List<WorkoutProgram>> getProgramsByCategory(int categoryId); // Экран 3 (все программы)
  Future<WorkoutProgram> getProgramDetails(int programId); // Полная информация о программе
}