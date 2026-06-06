import 'package:dio/dio.dart';
import '../models/workout_dto.dart';

class UserExercisesRemoteDataSource {
  final Dio _dio;

  UserExercisesRemoteDataSource(this._dio);

  Future<List<ExerciserDto>> getUserExercises(int userId) async {
    final response = await _dio.get('/get-user-exercise/$userId');
    final List<dynamic> data = response.data['exercises'] ?? [];
    return data.map((json) => ExerciserDto.fromJson(json)).toList();
  }

  Future<ProgramDto?> getCurrentExercise(int userId) async {
    try {
      final response = await _dio.get('/get-current-exercise/$userId');
      if (response.data == null) return null;
      return ProgramDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<void> addExerciseForUser(int userId, ExerciserDto exercise) async {
    await _dio.post('/create-exercise/$userId', data: exercise.toJson());
  }

  Future<void> updateExercise(int exerciseId, ExerciserDto exercise) async {
    await _dio.put('/update-exercise/$exerciseId', data: exercise.toJson());
  }

  Future<void> deleteExercise(int exerciseId) async {
    await _dio.delete('/delete-exercise/$exerciseId');
  }
}
