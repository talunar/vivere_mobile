// 1. Импорты из Domain (Контракт и Чистые сущности)
import '../../domain/repositories/i_workout_repository.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/exercise.dart';

import '/features/workout/models/workout_dto.dart';
import '../mappers/workout_mapper.dart';

// Представим, что мы используем Dio для сетевых запросов
import 'package:dio/dio.dart';

class WorkoutRepositoryImpl implements IWorkoutRepository {
  final Dio _dio;

  WorkoutRepositoryImpl(this._dio);

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    // Делаем запрос к go-бэку
    final response = await _dio.get('/categories/$id');
    // Парсим JSON в DTO
    final dto = CategoryDto.fromJson(response.data);
    // Превращаем DTO в чистую сущность Domain (toDomain() берется из маппера) - прощай матрешка с go
    return dto.toDomain();
  }

  @override
  Future<List<Exercise>> getExercises() async {
    final response = await _dio.get('/exercises');

    // Если приходит список, мапим каждый элемент
    final List<dynamic> data = response.data;
    return data
        .map((json) => ExerciseDto.fromJson(json).toDomain())
        .toList();
  }
}