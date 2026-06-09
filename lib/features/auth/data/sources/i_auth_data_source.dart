import '../models/auth_dto.dart';

abstract class IAuthDataSource {
  Future<String> login(String username, String password);
  Future<String> register(AuthDto authData);
  Future<String> refreshToken(String username);
  Future<int> createProfile(Map<String, dynamic> data);
  Future<void> logout();
}
