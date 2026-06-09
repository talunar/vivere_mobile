import '../entities/auth_user.dart';

abstract class IAuthRepository {
  /// Вход в систему (POST /login)
  Future<AuthUser> signIn(String nickName, String password);

  /// Регистрация аккаунта (POST /register)
  Future<void> signUp({
    required String nickName, 
    required String password, 
    required String confirmPassword,
  });

  /// Смена пароля (на основе AuthModel в Go)
  Future<void> changePassword({
    required String nickName,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });

  /// Создание профиля пользователя (POST /create-user)
  Future<AuthUser> createProfile({
    required String nickName,
    required String email,
    required String firstName,
    required String lastName,
    required int age,
    required int weight,
    required int height,
    required String birthDate,
  });

  /// Выход из системы (GET /logout)
  Future<void> signOut();
}
