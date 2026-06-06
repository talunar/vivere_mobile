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
    _restoreSession();
    return const AuthState.initial();
  }

  Future<void> _restoreSession() async {
    state = const AuthState.loading();
    
    try {
      final jar = await ref.read(cookieJarProvider.future);
      final uri = Uri.parse('http://localhost:8080');
      final cookies = await jar.loadForRequest(uri);
      final hasSession = cookies.any((c) => c.name == 'Authorization-XXX');

      if (hasSession) {
        state = AuthState.authenticated(AuthUser(
          id: const UserId(1),
          email: 'user@vivere.app',
          nickName: 'User',
        ));
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  /// Вход
  Future<void> continueToNextStep(String nick, String pass) async {
    state = const AuthState.loading();
    await Future.delayed(const Duration(milliseconds: 500));

    // ВРЕМЕННО: вход сразу минуя регистрацию
    state = AuthState.authenticated(AuthUser(
      id: UserId(1),
      email: '${nick.isEmpty ? "user" : nick}@vivere.app',
      nickName: nick.isEmpty ? "TestUser" : nick,
    ));
  }

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

  Future<void> completeRegistration({
    required int age,
    required int weight,
    required int height,
    required String birthDate,
    Gender? gender,
  }) async {
    final currentState = state;
    state = const AuthState.loading();

    currentState.maybeMap(
      registrationStepPhysical: (step) {
        final registrationData = {
          'nick_name': step.nickName,
          'email': step.email,
          'first_name': step.firstName,
          'last_name': step.lastName,
          'password': step.password,
          'age': age,
          'weight': weight,
          'height': height,
          'birth_date': birthDate,
          'gender': gender?.name,
        };
        print('Данные для отправки на бэкенд (/create-user): $registrationData');
      },
      orElse: () {},
    );

    await Future.delayed(const Duration(milliseconds: 800));

    state = AuthState.authenticated(AuthUser(
      id: UserId(1),
      email: currentState is RegistrationStepPhysical ? currentState.email : 'user@vivere.app',
      nickName: currentState is RegistrationStepPhysical ? currentState.nickName : 'User',
    ));
  }

  Future<void> logout() async {
    final jar = await ref.read(cookieJarProvider.future);
    await jar.deleteAll();
    state = const AuthState.unauthenticated();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
}
