import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../sources/auth_mock_data_source.dart';
import '../models/auth_dto.dart';

class AuthRepository implements IAuthRepository {
  final AuthMockDataSource _dataSource;

  AuthRepository(this._dataSource);

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    final token = await _dataSource.login(nickName, password);
    
    // Имитируем данные пользователя, которые обычно приходят вместе с токеном
    return AuthUser(
      id: const UserId(1),
      nickName: nickName,
      email: 'test@vivere.com',
      token: token,
    );
  }

  @override
  Future<AuthUser> signUp(String nickName, String password, String email) async {
    final token = await _dataSource.register(AuthDto(
      nickName: nickName,
      password: password,
    ));
    
    return AuthUser(
      id: const UserId(2),
      nickName: nickName,
      email: email,
      token: token,
    );
  }

  @override
  Future<void> signOut() async {
    await _dataSource.logout();
  }
}
