import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/state/auth_state.dart';

// Импорты экранов
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registration_details_screen.dart';
import '../../features/profile//presentation/screens/profile_setup_screen.dart';
import '../../features/workout/presentation/screens/home_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/login',

    // Основная логика перенаправлений
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegDetails = state.matchedLocation == '/registration_details';
      final isProfileSetup = state.matchedLocation == '/profile_setup';

      return authState.when(
        initial: () => null,
        loading: () => null,

        // Если не авторизован — только на логин
        unauthenticated: () => isLoggingIn ? null : '/login',

        // ШАГ 2: Ввод ФИО и Почты
        registrationStepName: (login, password) =>
        isRegDetails ? null : '/registration_details',

        // ШАГ 3: Ввод физических параметров (рост/вес/пол)
        registrationStepPhysical: (nick, pass, first, last, email) =>
        isProfileSetup ? null : '/profile_setup',

        // Если профиль почему-то не заполнен (для существующих юзеров)
        profileSetupRequired: (_) =>
        isProfileSetup ? null : '/profile_setup',

        // Успешный вход — идем домой
        authenticated: (_) {
          if (isLoggingIn || isRegDetails || isProfileSetup) return '/home';
          return null;
        },

        // При ошибке остаемся на логине
        error: (message, _) => isLoggingIn ? null : '/login',
      );
    },

    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/registration_details',
        builder: (context, state) => const RegistrationDetailsScreen(),
      ),
      //GoRoute(
        //path: '/profile_setup',
       // builder: (context, state) => const ProfileSetupScreen(),
      //),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}