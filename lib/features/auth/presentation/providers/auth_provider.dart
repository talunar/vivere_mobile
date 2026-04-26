import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/auth_state.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:vivere_mobile/core/network/dio_provider.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.initial();

  /// Вход
  Future<void> continueToNextStep(String nick, String pass) async {
    state = const AuthState.loading();

    try {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.signIn(nick, pass);

      // Если email пустой (заглушка), отправляем на донастройку
      if (user.email.isEmpty) {
        state = AuthState.profileSetupRequired(user);
      } else {
        state = AuthState.authenticated(user);
      }
    } catch (e) {
      final errorStr = e.toString().toLowerCase();
      // Проверяем ошибку. Если пользователь не найден —> регистрация
      if (errorStr.contains('404') || errorStr.contains('not found')) {
        state = AuthState.registrationStepName(
          nickName: nick,
          password: pass,
        );
      } else {
        state = AuthState.error(e.toString());
      }
    }
  }

  /// Сохранение Имени и Почты после Входа
  void submitNameAndEmail({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    // Добавила mapOrNull чтобы избежать ошибок рантайма
    state.mapOrNull(
      registrationStepName: (step) {
        state = AuthState.registrationStepPhysical(
          nickName: step.nickName,
          password: step.password,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );
      },
    );
  }

  /// Регистрация
  Future<void> completeRegistration({
    required double weight,
    required double height,
    required int age,
  }) async {
    // Добавила mapOrNull чтобы избежать ошибок рантайма
    final physicalStep = state.mapOrNull(registrationStepPhysical: (s) => s);

    if (physicalStep != null) {
      state = const AuthState.loading();
      try {
        final user = await ref.read(authRepositoryProvider).signUp(
          physicalStep.nickName,
          physicalStep.password,
          physicalStep.email,
        );
        state = AuthState.authenticated(user);
      } catch (e) {
        state = AuthState.error(e.toString());
      }
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    try {
      await ref.read(authRepositoryProvider).signOut();
    } finally {
      state = const AuthState.unauthenticated();
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
}