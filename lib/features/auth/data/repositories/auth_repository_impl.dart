import 'package:dio/dio.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../models/auth_dto.dart';
import '../mappers/auth_mapper.dart';

class AuthRepository implements IAuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return const AuthUser(
      id: UserId(1),
      nickName: 'Ёжик',
      email: 'test@vivere.com',
      token: 'fake-jwt-token',
    );
  }

/* TODO Используем Заглушку. После подключения к бэку - раскомментировать
  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'nick_name': nickName,
        'password': password,
      });

      // Бэк возвращает {"auth": "ok"}
      if (response.data['auth'] == 'ok') {
        // Создаем пользователя, используя введенные данные
        return const AuthDto().toDomain(
          nickName: nickName,
          email: '', // В логине нет email, ставим пустую строку
        );
      } else {
        // Если в JSON пришла ошибка (например, из ErrDescription на Go)
        final errorMsg = response.data['auth'] ?? 'Неверный логин или пароль';
        throw Exception(errorMsg);
      }
    } on DioException catch (e) {
      final message = e.response?.data['auth'] ?? 'Ошибка авторизации';
      throw Exception(message);
    } catch (e) {
      throw Exception('Произошла непредвиденная ошибка');
    }
  }
 */

  @override
  Future<AuthUser> signUp(String nickName, String password, String email) async {
    try {
      final response = await _dio.post('/register', data: {
        'nick_name': nickName,
        'password': password,
        'password2': password, // Для валидации на Go
      });

      // Бэк возвращает {"register": "ok"}
      if (response.data['register'] == 'ok') {
        return const AuthDto().toDomain(
          nickName: nickName,
          email: email,
        );
      } else {
        final errorMsg = response.data['register'] ?? 'Ошибка при регистрации';
        throw Exception(errorMsg);
      }
    } catch (e) {
      throw Exception('Ошибка при регистрации');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _dio.get('/logout');
    } catch (e) {
      // Игнорируем ошибки при выходе
    }
    print('Выход из системы: куки будут удалены бэкендом');
  }
}