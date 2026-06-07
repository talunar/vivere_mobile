import 'package:dio/dio.dart';
import '../../../../core/network/api_error.dart';
import '../models/workout_dto.dart';
import 'i_user_exercises_data_source.dart';

class UserExercisesRemoteDataSource implements IUserExercisesDataSource {
  final Dio _dio;

  UserExercisesRemoteDataSource(this._dio);

  @override
  Future<List<ExerciserDto>> getUserExercises(int userId) async {
    try {
      final response = await _dio.get('/get-user-exercise/$userId');
      final List<dynamic> data = response.data['exercises'] ?? [];
      return data.map((json) => ExerciserDto.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<ProgramDto?> getCurrentExercise(int userId) async {
    try {
      final response = await _dio.get('/get-current-exercise/$userId');
      if (response.data == null) return null;
      return ProgramDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<void> addExerciseForUser(int userId, ExerciserDto exercise) async {
    try {
      await _dio.post('/create-exercise/$userId', data: exercise.toJson());
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<void> updateExercise(int exerciseId, ExerciserDto exercise) async {
    try {
      await _dio.put('/update-exercise/$exerciseId', data: exercise.toJson());
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<void> deleteExercise(int exerciseId) async {
    try {
      await _dio.delete('/delete-exercise/$exerciseId');
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }
}
