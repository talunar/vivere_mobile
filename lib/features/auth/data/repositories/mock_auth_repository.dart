import 'package:dio/dio.dart';
import 'auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/domain/entities/user_id.dart';

class MockAuthRepository extends AuthRepository {
  MockAuthRepository() : super(Dio());

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    return const AuthUser(
      id: UserId(1),
      email: 'mock@vivere.app',
      nickName: 'Iron_User',
      token: 'fake_token',
    );
  }

  @override
  Future<AuthUser> signUp(String nickName, String password, String email) async {
    return AuthUser(
      id: const UserId(1),
      email: email,
      nickName: nickName,
      token: 'fake_token',
    );
  }

  @override
  Future<void> signOut() async {}
}
