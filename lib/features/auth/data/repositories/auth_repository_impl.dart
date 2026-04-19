import 'package:dio/dio.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/auth_user.dart'; // проверь путь
import '../models/auth_dto.dart';
import '../mappers/auth_mapper.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final Dio _dio;

  AuthRepositoryImpl(this._dio);

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    // Отправляем запрос
    final response = await _dio.post('/login', data: {
      'nick_name': nickName,
      'password': password,
    });

    // Получаем DTO
    final dto = AuthDto.fromJson(response.data);

    // Маппим в Domain, передавая обязательные поля
    return dto.toDomain(
      id: response.data['id'].toString(),
      token: response.data['token'],
      email: response.data['email'] ?? '',
    );
  }

  @override
  Future<AuthUser> signUp(String nickName, String password, String confirmPassword) async {
    // Тут будет логика регистрации
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    // Тут будет логика выхода
    throw UnimplementedError();
  }
}