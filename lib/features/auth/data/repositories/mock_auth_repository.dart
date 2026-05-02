import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../../../core/domain/entities/user_id.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    // Имитируем задержку сети
    await Future.delayed(const Duration(milliseconds: 500));
    
    return const AuthUser(
      id: UserId(1),
      email: 'mock@vivere.app',
      nickName: 'Iron_User',
      token: 'fake_token_123',
    );
  }

  @override
  Future<AuthUser> signUp(String nickName, String password, String emailOrConfirm) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AuthUser(
      id: const UserId(1),
      email: 'new_user@vivere.app',
      nickName: nickName,
      token: 'fake_token_456',
    );
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
