import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/router.dart';
import 'features/auth/data/repositories/mock_auth_repository.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/profile/data/repositories/mock_profile_repository.dart';
import 'features/profile/presentation/providers/profile_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        // Подменяем репозитории на моки для разработки
        authRepositoryProvider.overrideWith((ref) => MockAuthRepository()),
        profileRepositoryProvider.overrideWith((ref) => MockProfileRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Vivere Mobile',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF5900)),
        useMaterial3: true,
        fontFamily: 'Golos Text',
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(letterSpacing: -0.4),
          titleLarge: TextStyle(letterSpacing: -0.6),
        ),
      ),
    );
  }
}
