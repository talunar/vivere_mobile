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

      // Если статус ответа 200 и в теле сообщения "auth: ok"
      if (response.data['auth'] == 'ok') {
        return const AuthDto(nickName: '', password: '').toDomain(
          nickName: nickName,
          email: '',
        );
      } else {
        // Если бэк прислал 200, но в теле сообщения ошибка валидации
        throw Exception(response.data['auth'] ?? 'Ошибка входа');
      }
    } on DioException catch (e) {
      // Ловим ошибки 4хх, 500 и проблемы с сетью
      final message = e.response?.data['auth'] ?? 'Ошибка авторизации';
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
        'password2': password,
        'email': email,
      });

      final data = response.data;

      // Проверяем успешный ответ с бэка (register: ok)
      if (data['register'] == 'ok') {
        return const AuthDto().toDomain(
          nickName: nickName,
          email: email,
        );
      } else {
        throw Exception(data['register'] ?? 'Ошибка при регистрации');
      }
    } on DioException catch (e) {
      final message = e.response?.data['register'] ?? 'Ошибка при регистрации';
      throw Exception(message);
    } catch (e) {
      throw Exception('Ошибка при регистрации');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Вызываем метод logout на бэкенде, чтобы он удалил куки
      await _dio.get('/logout');
    } catch (e) {
      // Даже если запрос не прошел, считаем, что ok, чтобы пройти
    }
    print('Выход из системы: сессия завершена');
  }
}