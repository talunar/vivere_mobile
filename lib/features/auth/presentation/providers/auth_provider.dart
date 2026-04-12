import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/auth_state.dart';
import '../../domain/providers/auth_providers.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => AuthInitial();

  Future<void> login(String login, String pass) async {
    state = AuthLoading();
    try {
      // Используем ref.read для доступа к провайдерам из домена
      final user = await ref.read(signInUseCaseProvider).execute(login, pass);
      state = Authenticated(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }

  Future<void> register(String login, String pass, String confirm) async {
    state = AuthLoading();
    try {
      final user = await ref.read(signUpUseCaseProvider).execute(login, pass, confirm);
      state = ProfileSetupRequired(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }
}