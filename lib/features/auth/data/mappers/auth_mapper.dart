import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/auth_user.dart';
import '../models/auth_dto.dart';

extension AuthDtoX on AuthDto {
  AuthUser toDomain({
    required String id,
    String? token,
    required String email,
  }) {
    return AuthUser(
      id: UserId(id),
      email: email,
      nickName: nickName,
      token: token,
    );
  }
}