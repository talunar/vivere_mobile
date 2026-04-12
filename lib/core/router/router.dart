import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/state/auth_state.dart';

// Здесь импортируем экраны
import '../../features/auth/presentation/screens/login_screen.dart';
//import '../../features/profile/presentation/screens/profile_setup_screen.dart';
import '../../features/workout/presentation/screens/home_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  // Слушаем состояние авторизации
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(), // Твой экран логина
      ),
      //GoRoute(
        //path: '/profile_setup',
        //builder: (context, state) => const ProfileSetupScreen(), // Экран ФИО/Вес/Рост
      //),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(), // Главный экран тренировок
      ),
    ],

    redirect: (context, state) {
      // Если мы в процессе загрузки или в начальном состоянии — ничего не делаем
      if (authState is AuthLoading || authState is AuthInitial) return null;

      final isLoggingIn = state.matchedLocation == '/login';

      // Если нет профиля - создаем
      if (authState is ProfileSetupRequired) {
        return '/profile_setup';
      }

      // Если успешно прошел аунтетификацию
      if (authState is Authenticated) {
        // то отправляем на домашнюю страницу
        return isLoggingIn ? '/home' : null;
      }

      // Если произошла ошибка или разлогинились
      if (authState is AuthError || authState is AuthInitial) {
        return '/login';
      }

      return null;
    },
  );
}