import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_user.dart';

part 'auth_state.freezed.dart';

/// Перечисление для выбора пола
enum Gender { male, female, other}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Если юзера нет и нужно ввести ФИО и Почту
  const factory AuthState.registrationStepName({
    required String nickName,
    required String password,
  }) = RegistrationStepName;

  /// После ФИО и почты мы переходим к росту/весу/полу
  const factory AuthState.registrationStepPhysical({
    required String nickName,
    required String password,
    required String firstName,
    required String lastName,
    required String email,
  }) = RegistrationStepPhysical;

  /// Состояние, если профиль существует, но данные в нем пустые (для старых юзеров)
  const factory AuthState.profileSetupRequired(AuthUser user) = ProfileSetupRequired;

  /// Финальное состояние — пользователь полностью вошел
  const factory AuthState.authenticated(AuthUser user) = Authenticated;

  /// Состояние ошибки (неверный пароль, проблемы с сетью)
  const factory AuthState.error(String message, {Object? error}) = AuthError;
}