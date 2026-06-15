import '../../../../core/domain/entities/user_id.dart';
import 'package:vivere_mobile/core/domain/entities/gender.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../models/auth_dto.dart';
import '../sources/i_auth_data_source.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> changePassword({
    required String nickName,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    await _dataSource.changePassword(nickName, newPassword, confirmPassword);
  }

  @override
  Future<AuthUser> signIn(String nickName, String password) async {
    final result = await _dataSource.login(nickName, password);

    if (result == 'ok' || result.isNotEmpty) {
      return AuthUser(
        id: const UserId(0),
        email: '',
        nickName: nickName,
      );
    } else {
      throw Exception('Ошибка авторизации');
    }
  }

  @override
  Future<void> signUp({
    required String nickName, 
    required String password, 
    required String confirmPassword,
  }) async {
    final dto = AuthDto(
      nickName: nickName,
      password: password,
      confirmPassword: confirmPassword,
    );
    
    final result = await _dataSource.register(dto);
    if (result != 'ok') {
      throw Exception(result);
    }
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
    final data = {
      'nick_name': nickName,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
      'weight': weight,
      'height': height,
      'birth_date': birthDate,
      'gender': _genderToInt(gender),
    };

    final userId = await _dataSource.createProfile(data);

    return AuthUser(
      id: UserId(userId),
      email: email,
      nickName: nickName,
    );
  }

  int _genderToInt(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 1;
      case Gender.female:
        return 2;
      case Gender.other:
        return 3;
    }
  }

  @override
  Future<void> signOut() async {
    await _dataSource.logout();
  }
}
