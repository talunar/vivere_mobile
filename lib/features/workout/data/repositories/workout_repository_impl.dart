import '../../domain/repositories/i_workout_repository.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../sources/i_workout_data_source.dart';
import '../mappers/workout_mapper.dart';

class WorkoutRepositoryImpl implements IWorkoutRepository {
  final IWorkoutDataSource _dataSource;

  WorkoutRepositoryImpl(this._dataSource);

  @override
  Future<List<WorkoutCategory>> getCategories({int limit = 10, int offset = 0}) async {
    final dtos = await _dataSource.getCategories(limit: limit, offset: offset);
    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    final dto = await _dataSource.getCategory(id);
    return dto.toDomain();
  }

  @override
  Future<List<WorkoutProgram>> getProgramsByCategory(
    int categoryId, {
    int limit = 10,
    int offset = 0,
  }) async {
    final dto = await _dataSource.getCategory(categoryId);
    return dto.programs?.map((p) => p.toDomain()).toList() ?? [];
  }

  @override
  Future<WorkoutProgram> getProgramDetails(int programId) async {
    final dto = await _dataSource.getWorkout(programId);
    return dto.toDomain();
  }
}
