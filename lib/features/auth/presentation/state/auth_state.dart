import '/core/domain/entities/auth_user.dart';

// sealed — значит никто не может создать подтип этого класса вне этого файла.
// Это дает компилятору полный контроль над всеми состояниями.
sealed class AuthState {
  const AuthState();
}

// 1. Начальное состояние (когда пользователь только открыл приложение)
class AuthInitial extends AuthState {}

// 2. Состояние загрузки (нажали кнопку "Войти", ждем ответа от Go)
class AuthLoading extends AuthState {}

// 3. Состояние ошибки (неверный пароль или сервер упал)
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// 4. Состояние "Старичок" (успешный вход, профиль уже есть)
class Authenticated extends AuthState {
  final AuthUser user;
  Authenticated(this.user);
}

// 5. Состояние "Новичок" (регистрация прошла, но нужно заполнить ФИО/Вес/Рост)
class ProfileSetupRequired extends AuthState {
  final AuthUser user;
  ProfileSetupRequired(this.user);
}