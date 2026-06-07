import '../models/workout_dto.dart';

abstract class IWorkoutDataSource {
  Future<List<CategoryDto>> getCategories({int limit = 10, int offset = 0});
  Future<CategoryDto> getCategory(int id);
  Future<ProgramDto> getWorkout(int id);
}
