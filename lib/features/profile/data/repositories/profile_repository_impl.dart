import 'package:dio/dio.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/domain/failures/failure.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../models/profile_dto.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  final Dio _dio;

  ProfileRepositoryImpl(this._dio);

  @override
  Future<UserProfile> getProfile(UserId id) async {
    try {
      final response = await _dio.get('/profile/${id.value}');
      // Используем DTO для парсинга и маппим в Entity
      return ProfileDto.fromJson(response.data).toDomain();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ProfileFailure('Ошибка при загрузке профиля: $e');
    }
  }

  @override
  Future<UserId> createProfile(UserProfile profile) async {
    try {
      final dto = ProfileDto.fromDomain(profile);
      // Используем чистый метод для создания без ID
      final response = await _dio.post('/profile', data: dto.toCreateJson());
      
      final idValue = response.data is Map ? response.data['id'] : response.data;
      return UserId(idValue as int);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ProfileFailure('Ошибка при создании профиля: $e');
    }
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    try {
      final dto = ProfileDto.fromDomain(profile);
      final response = await _dio.put(
        '/profile/${profile.id.value}',
        data: dto.toJson(),
      );
      return ProfileDto.fromJson(response.data).toDomain();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ProfileFailure('Ошибка при обновлении профиля: $e');
    }
  }

  @override
  Future<void> deleteProfile(UserId id) async {
    try {
      await _dio.delete('/profile/${id.value}');
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ProfileFailure('Ошибка при удалении профиля: $e');
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const NetworkFailure('Проблемы с интернет-соединением');
    }
    
    final message = e.response?.data['error'] ?? 'Неизвестная ошибка сервера';
    
    switch (e.response?.statusCode) {
      case 404:
        return ProfileFailure('Профиль не найден');
      case 401:
        return const ServerFailure('Необходима авторизация');
      default:
        return ServerFailure(message);
    }
  }
}
