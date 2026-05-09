import '../entities/auth_user.dart';

abstract class IAuthRepository {
  Future<AuthUser> signIn(String nickName, String password);

  Future<AuthUser> signUp(String nickName, String password, String confirmPassword);

  Future<void> signOut();
}