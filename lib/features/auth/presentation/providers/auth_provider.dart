import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/auth_state.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/auth_mock_data_source.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/domain/entities/user_id.dart';
// Добавляем недостающие импорты
import '../../../profile/presentation/providers/profile_providers.dart';
import '../../../profile/domain/entities/user_profile.dart';
import '../../../profile/domain/value_objects/physical_parameters.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState.unauthenticated();
  }

  Future<void> continueToNextStep(String nick, String pass) async {
    state = const AuthState.loading();

    try {
      final repository = ref.read(authRepositoryProvider);

      // Заходим сразу, остальное через регистрацию
      if (nick == 'admin') {
        final user = await repository.signIn(nick, pass);
        state = AuthState.authenticated(user);
      } else {
        // Имитируем переход на шаг регистрации
        await Future.delayed(const Duration(milliseconds: 500));
        state = AuthState.registrationStepName(
          nickName: nick,
          password: pass,
        );
      }
    } catch (e) {
      state = AuthState.unauthenticated();
    }
  }

  /// Сохранение Имени и Почты
  void submitNameAndEmail({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    state.maybeMap(
      registrationStepName: (step) {
        state = AuthState.registrationStepPhysical(
          nickName: step.nickName,
          password: step.password,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );
      },
      orElse: () {},
    );
  }

  /// Регистрация (финализация) через репозиторий
  Future<void> completeRegistration({
    required int age,
    required double weight,
    required double height,
  }) async {
    final currentState = state;
    if (currentState is! RegistrationStepPhysical) return;

    state = const AuthState.loading();

    try {
      final authRepo = ref.read(authRepositoryProvider);
      final profileRepo = ref.read(profileRepositoryProvider);

      // 1. Регистрация (вызывает /register на бэкенде)
      final authUser = await authRepo.signUp(
        currentState.nickName,
        currentState.password,
        currentState.password,
      );

      // 2. Создание профиля
      final newProfile = UserProfile(
        id: authUser.id,
        nickName: currentState.nickName,
        email: currentState.email,
        firstName: currentState.firstName,
        lastName: currentState.lastName,
        age: age,
        weight: Weight(weight),
        height: Height(height),
        birthDate: DateTime.now(),
      );

      await profileRepo.createProfile(newProfile);

      // 3. Успех
      state = AuthState.authenticated(authUser);
    } catch (e) {
      state = currentState;
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AuthState.unauthenticated();
  }
}

@Riverpod(keepAlive: true)
IAuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(AuthMockDataSource());
}
