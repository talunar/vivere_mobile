import '/core/network/dio_provider.dart';
import '../models/auth_dto.dart';

class AuthMockDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 800));

  Future<String> login(String nickName, String password) async {
    await _delay();
    // в Go это res из service.Login
    if (nickName == 'error') throw Exception('Invalid credentials');
    return 'mock_token_123';
  }

  Future<String> register(AuthDto data) async {
    await _delay();
    return 'mock_token_new_user';
  }

  Future<void> logout() async {
    await _delay();
  }
}
