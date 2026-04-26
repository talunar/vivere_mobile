import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_user.dart';
import '../state/auth_state.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.initial();

  /// Шаг 1: "Умный вход"
  /// Пытаемся авторизоваться. Если юзера нет — переходим к регистрации.
  Future<void> continueToNextStep(String nick, String pass) async {
    state = const AuthState.loading();

    try {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.signIn(nick, pass);

      // Если вход успешен, проверяем: заполнен ли профиль (есть ли email/имя)
      // Если чего-то не хватает — отправляем на донастройку
      if (user.email == null || user.email!.isEmpty) {
        state = AuthState.profileSetupRequired(user);
      } else {
        state = AuthState.authenticated(user);
      }
    } catch (e) {
      // Если ловим 404 — значит пользователя нет, идем на регистрацию
      if (e.toString().contains('404') || e.toString().contains('not found')) {
        state = AuthState.registrationStepName(
          nickName: nick,
          password: pass,
        );
      } else {
        // Если пароль неверный или сервер упал — показываем ошибку
        state = AuthState.error(e.toString());
      }
    }
  }

  /// Шаг 2: Сохранение Имени, Фамилии и Почты
  void submitNameAndEmail({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    final currentState = state;
    if (currentState is RegistrationStepName) {
      state = AuthState.registrationStepPhysical(
        nickName: currentState.nickName,
        password: currentState.password,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
    }
  }

  /// Шаг 3: Финальная регистрация (отправка всех данных на бэкенд)
  Future<void> completeRegistration({
    required double weight,
    required double height,
    required int age,
    // Здесь добавим Gender, когда создадим enum
  }) async {
    final currentState = state;
    if (currentState is RegistrationStepPhysical) {
      state = const AuthState.loading();
      try {
        // Вызываем метод signUp в репозитории (нужно будет добавить туда эти поля)
        final user = await ref.read(authRepositoryProvider).signUp(
          nickName: currentState.nickName,
          password: currentState.password,
          email: currentState.email,
          // Дополнительные поля передаем в репозиторий
        );
        state = AuthState.authenticated(user);
      } catch (e) {
        state = AuthState.error(e.toString());
      }
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    await ref.read(authRepositoryProvider).signOut();
    state = const AuthState.unauthenticated();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  // В будущем baseUrl надо вынести в конфиг (не забыть бы)
  return AuthRepository(Dio(BaseOptions(baseUrl: 'http://your-backend-url:8080')));
}