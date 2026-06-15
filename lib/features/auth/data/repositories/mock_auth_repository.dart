import 'package:dio/dio.dart';
import 'auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/domain/entities/user_id.dart';
import 'package:vivere_mobile/core/domain/entities/gender.dart';

class MockAuthRepository extends AuthRepository {
  MockAuthRepository() : super(Dio());

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const AuthUser(
      id: UserId(1),
      email: 'mock@vivere.app',
      nickName: 'Iron_User',
      token: 'fake_token',
    );
  }

  @override
  Future<void> signUp({
    required String nickName,
    required String password,
    required String confirmPassword,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<AuthUser> createProfile({
    required String nickName,
    required String email,
    required String firstName,
    required String lastName,
    required int age,
    required int weight,
    required int height,
    required String birthDate,
    required Gender gender,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AuthUser(
      id: const UserId(1),
      email: email,
      nickName: nickName,
    );
  }

  @override
  Future<void> signOut() async {}
}
