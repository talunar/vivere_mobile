import 'package:dio/dio.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../../../core/domain/entities/auth_user.dart'; // Путь к сущности в Core
import '../models/auth_dto.dart';
import '../mappers/auth_mapper.dart';

class AuthRepository implements IAuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    final response = await _dio.post('/login', data: {
      'nick_name': nickName,
      'password': password,
    });

    final dto = AuthDto.fromJson(response.data);

    return dto.toDomain(
      id: response.data['id'].toString(),
      token: response.data['token'],
      email: response.data['email'] ?? '',
    );
  }

  @override
  Future<AuthUser> signUp(String nickName, String password, String email) async {
    // Пока просто заглушка, чтобы не было ошибки
    throw UnimplementedError('Метод signUp еще не реализован');
  }

  @override
  Future<void> signOut() async {
    // Заглушка для выхода
    print('Пользователь вышел');
  }
}