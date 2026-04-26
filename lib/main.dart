import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/workout/presentation/screens/navigation_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO использовать пакет window_manager, пока ограничиваем размер окна

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivere Mobile',
      debugShowCheckedModeBanner: false,
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
      // Указываем оболочку с меню как главный экран
      home: const MainNavigationScreen(),
    );
  }
}
