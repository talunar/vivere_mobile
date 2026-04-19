import '../entities/auth_user.dart';

abstract class IAuthRepository {
  // Вход
  Future<AuthUser> signIn(String nickName, String password);

  // Регистрация (добавляем confirmPassword, так как в auth.go он есть)
  Future<AuthUser> signUp(String nickName, String password, String confirmPassword);

  // Выход
  Future<void> signOut();
}