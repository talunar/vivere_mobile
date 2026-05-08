import '../entities/auth_user.dart';

abstract class IAuthRepository {
  // Вход
  Future<AuthUser> signIn(String nickName, String password);

  // Регистрация
  Future<AuthUser> signUp(String nickName, String password, String confirmPassword);

  // Выход
  Future<void> signOut();
}