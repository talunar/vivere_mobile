import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/auth_state.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/sources/i_auth_data_source.dart';
import '../../data/sources/auth_mock_data_source.dart';
import '../../data/sources/auth_remote_data_source.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../../../../core/domain/entities/user_id.dart';
import 'package:vivere_mobile/core/network/dio_provider.dart';
import 'package:vivere_mobile/core/network/network_config.dart';

part 'auth_provider.g.dart';

const bool _useRemoteDataSource = false;

@Riverpod(keepAlive: true)
IAuthDataSource authDataSource(AuthDataSourceRef ref) {
  if (_useRemoteDataSource) {
    final dio = ref.watch(dioProvider);
    return AuthRemoteDataSource(dio);
  }
  return AuthMockDataSource();
}

@Riverpod(keepAlive: true)
IAuthRepository authRepository(AuthRepositoryRef ref) {
  final dataSource = ref.watch(authDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
}

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
      final uri = Uri.parse(NetworkConfig.baseUrl);
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
    
    try {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.signIn(nick, pass);
      state = AuthState.authenticated(user);
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
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

    try {
      await currentState.maybeMap(
        registrationStepPhysical: (step) async {
          final repository = ref.read(authRepositoryProvider);
          
          await repository.signUp(
            nickName: step.nickName,
            password: step.password,
            confirmPassword: step.password,
          );

          final user = await repository.createProfile(
            nickName: step.nickName,
            email: step.email,
            firstName: step.firstName,
            lastName: step.lastName,
            age: age,
            weight: weight,
            height: height,
            birthDate: birthDate,
          );

          state = AuthState.authenticated(user);
        },
        orElse: () async {
          state = const AuthState.unauthenticated();
        },
      );
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> logout() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.signOut();
      final jar = await ref.read(cookieJarProvider.future);
      await jar.deleteAll();
    } finally {
      state = const AuthState.unauthenticated();
    }
  }
}
