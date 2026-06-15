import '../entities/auth_user.dart';
import '../repositories/i_auth_repository.dart';
import 'package:vivere_mobile/core/domain/entities/gender.dart';

class SignInUseCase {
  final IAuthRepository repository;
  SignInUseCase(this.repository);

  Future<AuthUser> execute(String nickName, String password) {
    return repository.signIn(nickName, password);
  }
}

class SignUpUseCase {
  final IAuthRepository repository;
  SignUpUseCase(this.repository);

  Future<void> execute({
    required String nickName,
    required String password,
    required String confirmPassword,
  }) {
    return repository.signUp(
      nickName: nickName,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}

class CreateProfileUseCase {
  final IAuthRepository repository;
  CreateProfileUseCase(this.repository);

  Future<AuthUser> execute({
    required String nickName,
    required String email,
    required String firstName,
    required String lastName,
    required int age,
    required int weight,
    required int height,
    required String birthDate,
    required Gender gender,
  }) {
    return repository.createProfile(
      nickName: nickName,
      email: email,
      firstName: firstName,
      lastName: lastName,
      age: age,
      weight: weight,
      height: height,
      birthDate: birthDate,
      gender: gender,
    );
  }
}
