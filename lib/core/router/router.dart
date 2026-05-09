import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/state/auth_state.dart';

// Импорты экранов
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registration_details_screen.dart';
import '../../features/auth/presentation/screens/profile_setup_screen.dart';
import '../../features/workout/presentation/screens/navigation_shell.dart';
import '../../features/workout/presentation/screens/program_details_screen.dart';
import '../../features/workout/domain/entities/workout_program.dart';
import '../../features/profile/presentation/screens/profile_settings_screen.dart';
part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final refreshListenable = ValueNotifier<bool>(false);

  ref.listen(authControllerProvider, (previous, next) {
    if (next is! AuthLoading) {
      refreshListenable.value = !refreshListenable.value;
    }
  });

  final initialState = ref.read(authControllerProvider);
  String initialLoc = '/login';
  
  initialState.maybeWhen(
    authenticated: (_) => initialLoc = '/home',
    registrationStepName: (_, __) => initialLoc = '/registration_details',
    registrationStepPhysical: (_, __, ___, ____, _____) => initialLoc = '/profile_setup',
    unauthenticated: () => initialLoc = '/login',
    orElse: () {},
  );

  return GoRouter(
    initialLocation: initialLoc,
    refreshListenable: refreshListenable,
    debugLogDiagnostics: true,
    
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final location = state.matchedLocation;

      if (authState is AuthLoading) return null;

      return authState.maybeWhen(
        authenticated: (_) => 
          ['/login', '/registration_details', '/profile_setup'].contains(location) 
          ? '/home' : null,
        
        registrationStepName: (_, __) => 
          location != '/registration_details' ? '/registration_details' : null,
        
        registrationStepPhysical: (_, __, ___, ____, _____) => 
          location != '/profile_setup' ? '/profile_setup' : null,

        unauthenticated: () => location != '/login' ? '/login' : null,
        error: (_, __) => location != '/login' ? '/login' : null,
        
        orElse: () => null,
      );
    },

    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const NoTransitionPage(child: LoginScreen()),
      ),
      GoRoute(
        path: '/registration_details',
        pageBuilder: (context, state) => const NoTransitionPage(child: RegistrationDetailsScreen()),
      ),
      GoRoute(
        path: '/profile_setup',
        pageBuilder: (context, state) => const NoTransitionPage(child: ProfileSetupScreen()),
      ),
      GoRoute(
        path: '/profile_settings',
        pageBuilder: (context, state) => const NoTransitionPage(child: ProfileSettingsScreen()),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MainNavigationScreen(),
      ),
      GoRoute(
        path: '/program_details',
        builder: (context, state) {
          final program = state.extra as WorkoutProgram;
          return ProgramDetailsScreen(program: program);
        },
      ),
    ],
  );
}
