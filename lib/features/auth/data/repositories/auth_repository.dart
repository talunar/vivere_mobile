import 'package:dio/dio.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/domain/entities/user_id.dart';

class AuthRepository implements IAuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  @override
  Future<void> changePassword({
    required String nickName,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await _dio.post('/change-password', data: {
        'nick_name': nickName,
        'old_password': oldPassword,
        'new_password': newPassword,
        'password2': confirmPassword,
      });
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Ошибка смены пароля');
    } catch (e) {
      throw Exception('Ошибка при смене пароля');
    }
  }

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'nick_name': nickName,
        'password': password,
      });

      if (response.data['auth'] == 'ok') {
        return AuthUser(
          id: const UserId(0),
          email: '',
          nickName: nickName,
        );
      } else {
        throw Exception(response.data['auth'] ?? 'Ошибка входа');
      }
    } on DioException catch (e) {
      final message = e.response?.data['auth'] ?? 'Ошибка авторизации';
      throw Exception(message);
    } catch (e) {
      throw Exception('Произошла непредвиденная ошибка');
    }
  }

  @override
  Future<void> signUp({
    required String nickName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post('/register', data: {
        'nick_name': nickName,
        'password': password,
        'password2': confirmPassword,
      });

      if (response.data['register'] != 'ok') {
        throw Exception(response.data['register'] ?? 'Ошибка регистрации');
      }
    } on DioException catch (e) {
      final message = e.response?.data['register'] ?? 'Ошибка при регистрации';
      throw Exception(message);
    } catch (e) {
      throw Exception('Ошибка при регистрации');
    }
  }

  @override
  Future<AuthUser> createProfile({
    required String nickName,
    required String email,
    required String firstName,
    required String lastName,
    required int age,
    required int weight,
    required int height,
    required String birthDate,
  }) async {
    try {
      final response = await _dio.post('/create-user', data: {
        'nick_name': nickName,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'age': age,
        'weight': weight,
        'height': height,
        'birth_date': birthDate,
      });

      final userId = response.data['userId'];
      if (userId != null) {
        return AuthUser(
          id: UserId(userId is int ? userId : int.parse(userId.toString())),
          email: email,
          nickName: nickName,
        );
      } else {
        throw Exception('Не удалось получить ID пользователя');
      }
    } on DioException catch (e) {
      final message = e.response?.data['error'] ?? 'Ошибка создания профиля';
      throw Exception(message);
    } catch (e) {
      throw Exception('Ошибка при создании профиля');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _dio.get('/logout');
    } catch (_) {}
  }
}
