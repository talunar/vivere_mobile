import 'package:dio/dio.dart';
import '../../../../core/network/api_error.dart';
import '../models/auth_dto.dart';
import 'i_auth_data_source.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> changePassword(String nickName, String newPassword, String confirmPassword) async {
    try {
      await _dio.post('/change-password', data: {
        'nick_name': nickName,
        'password': newPassword,
        'confirm_password': confirmPassword,
      });
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'nick_name': username,
        'password': password,
      });
      return response.data['auth'] ?? 'ok';
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<String> register(AuthDto authData) async {
    try {
      final response = await _dio.post('/register', data: authData.toJson());
      return response.data['register'] ?? 'ok';
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<String> refreshToken(String username) async {
    try {
      final response = await _dio.post('/refresh-token', data: {'nick_name': username});
      return response.data['refresh'] ?? 'ok';
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<int> createProfile(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/create-user', data: data);
      final userId = response.data['userId'];
      return userId is int ? userId : int.parse(userId.toString());
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.get('/logout');
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }
}
