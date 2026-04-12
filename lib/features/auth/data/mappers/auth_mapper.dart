import '/core/domain/entities/auth_user.dart';
import '../models/auth_dto.dart';

extension AuthDtoX on AuthDto {
  AuthUser toDomain({required String id, String? token, required String email}) {
    return AuthUser(
      id: id,
      email: email,       // Добавляем обязательный email
      nickName: nickName, // Проверь, что в AuthDto поле называется именно nickName
      token: token,
    );
  }
}