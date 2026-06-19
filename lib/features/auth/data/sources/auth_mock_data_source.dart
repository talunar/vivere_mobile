import '../models/auth_dto.dart';
import 'i_auth_data_source.dart';

class AuthMockDataSource implements IAuthDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 800));

  @override
  Future<void> changePassword(String nickName, String newPassword, String confirmPassword) async {
    await _delay();
  }

  @override
  Future<String> login(String username, String password) async {
    await _delay();
    // Теперь, если логин НЕ 'admin', будет запускаться регистрация
    if (username != 'admin') {
      throw Exception('User not found');
    }
    return 'mock_token_123';
  }

  @override
  Future<String> register(AuthDto authData) async {
    await _delay();
    return 'ok';
  }

  @override
  Future<String> refreshToken(String username) async {
    await _delay();
    return 'mock_new_token_456';
  }

  @override
  Future<int> createProfile(Map<String, dynamic> data) async {
    await _delay();
    return 1;
  }

  @override
  Future<void> logout() async {
    await _delay();
  }
}
