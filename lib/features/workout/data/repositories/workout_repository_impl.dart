import 'package:dio/dio.dart';
import '../../domain/repositories/i_workout_repository.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../models/workout_dto.dart';
import '../mappers/workout_mapper.dart';

class WorkoutRepositoryImpl implements IWorkoutRepository {
  final Dio _dio;

  WorkoutRepositoryImpl(this._dio);

  @override
  Future<List<WorkoutCategory>> getCategories({int limit = 10, int offset = 0}) async {
    try {
      final response = await _dio.get('/categories', queryParameters: {
        'limit': limit,
        'offset': offset,
      });
      final List<dynamic> data = response.data;
      return data
          .map((json) => CategoryDto.fromJson(json).toDomain())
          .toList();
    } catch (e) {
      throw Exception('Ошибка при получении категорий: $e');
    }
  }

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    try {
      final response = await _dio.get('/categories/$id');
      final dto = CategoryDto.fromJson(response.data);
      return dto.toDomain();
    } catch (e) {
      throw Exception('Не удалось загрузить категорию: $e');
    }
  }

  @override
  Future<List<WorkoutProgram>> getProgramsByCategory(int categoryId) async {
    try {
      final response = await _dio.get('/categories/$categoryId/programs');
      final List<dynamic> data = response.data;
      return data
          .map((json) => ProgramDto.fromJson(json).toDomain())
          .toList();
    } catch (e) {
      throw Exception('Ошибка при получении программ категории: $e');
    }
  }

  @override
  Future<WorkoutProgram> getProgramDetails(int programId) async {
    try {
      final response = await _dio.get('/programs/$programId');
      final dto = ProgramDto.fromJson(response.data);
      return dto.toDomain();
    } catch (e) {
      throw Exception('Не удалось загрузить детали программы: $e');
    }
  }
}
