// sign_in_use_case.dart
import '/core/domain/entities/auth_user.dart';
import '../repositories/i_auth_repository.dart';

class SignInUseCase {
  final IAuthRepository repository;
  SignInUseCase(this.repository);

  Future<AuthUser> execute(String nickName, String password) {
    return repository.signIn(nickName, password);
  }
}

// sign_up_use_case.dart
class SignUpUseCase {
  final IAuthRepository repository;
  SignUpUseCase(this.repository);

  Future<AuthUser> execute(String nickName, String password, String confirmPassword) {
    return repository.signUp(nickName, password, confirmPassword);
  }
}