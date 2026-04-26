import 'package:dio/dio.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../models/auth_dto.dart';
import '../mappers/auth_mapper.dart';

class AuthRepository implements IAuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'nick_name': nickName,
        'password': password,
      });

      final data = response.data;
      final dto = AuthDto.fromJson(data);

      return dto.toDomain(
        id: data['id'].toString(),
        token: data['token'],
        email: data['email'] ?? '',
      );
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Ошибка авторизации';
      throw Exception(message);
    } catch (e) {
      throw Exception('Произошла непредвиденная ошибка');
    }
  }

  @override
  Future<AuthUser> signUp(String nickName, String password, String email) async {
    try {
      final response = await _dio.post('/register', data: {
        'nick_name': nickName,
        'password': password,
        'email': email,
      });

      final data = response.data;
      final dto = AuthDto.fromJson(data);

      return dto.toDomain(
        id: data['id'].toString(),
        token: data['token'],
        email: data['email'] ?? '',
      );
    } catch (e) {
      throw Exception('Ошибка при регистрации');
    }
  }

  @override
  Future<void> signOut() async {
    // В будущем здесь будет запрос к API для инвалидации токена
    // и очистка SecureStorage
    print('Выход из системы: токен аннулирован локально');
  }
}