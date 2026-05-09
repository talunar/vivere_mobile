import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/auth_state.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/domain/entities/user_id.dart';
import 'package:vivere_mobile/core/network/dio_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    // Для тестирования
    return const AuthState.unauthenticated();
  }

  /// Вход
  Future<void> continueToNextStep(String nick, String pass) async {
    state = const AuthState.loading();
    await Future.delayed(const Duration(milliseconds: 800));
    
    if (nick == 'admin') {
      state = AuthState.authenticated(AuthUser(
        id: UserId(1),
        email: 'admin@vivere.app',
        nickName: nick,
      ));
    } else {
      state = AuthState.registrationStepName(
        nickName: nick,
        password: pass,
      );
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

  /// Регистрация (финализация)
  Future<void> completeRegistration({
    required int age,
    required double weight,
    required double height,
  }) async {
    state = const AuthState.loading();
    await Future.delayed(const Duration(milliseconds: 800));
    
    state = AuthState.authenticated(AuthUser(
      id: UserId(1),
      email: 'new_user@vivere.app',
      nickName: 'NewUser',
    ));
  }

  Future<void> logout() async {
    state = const AuthState.unauthenticated();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
}
