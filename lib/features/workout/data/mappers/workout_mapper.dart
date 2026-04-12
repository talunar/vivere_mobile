// 1. Импорты из Domain (Контракт и Чистые сущности)
import '../../domain/repositories/i_workout_repository.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/exercise.dart';

// 2. Импорты из Data (DTO - матрешки и Мапперы - переводчики)
import '/features/workout/models/workout_dto.dart';
import '../mappers/workout_mapper.dart';

// Представим, что мы используем Dio для сетевых запросов
import 'package:dio/dio.dart';

class WorkoutRepositoryImpl implements IWorkoutRepository {
  final Dio _dio;

  WorkoutRepositoryImpl(this._dio);

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    // 1. Делаем запрос к твоему Go-бэкенду
    final response = await _dio.get('/categories/$id');

    // 2. Парсим JSON в DTO (Модель, которая знает про структуру JSON в Go)
    final dto = CategoryDto.fromJson(response.data);

    // 3. Превращаем DTO в чистую сущность Domain (toDomain() берется из маппера)
    // Это и есть то, что мы обсуждали: матрешка разбирается здесь.
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