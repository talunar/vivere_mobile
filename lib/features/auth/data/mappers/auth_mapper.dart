import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/auth_user.dart';
import '../models/auth_dto.dart';

extension AuthDtoX on AuthDto {
  /// TODO Создаем модель из того, что может ввести пользователь без учета бэка и JSON
  AuthUser toDomain({
    required String nickName,
    required String email,
  }) {
    return AuthUser(
      id: const UserId(1), // Заглушка ID
      email: email,
      nickName: nickName,
      token: 'fake_token_from_cookie', // Пометка, что токен в куках
    );
  }
}