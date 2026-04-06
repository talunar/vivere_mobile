import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/workout/presentation/screens/home_screen.dart';

void main() {
  // ProviderScope — это обязательная "обертка", чтобы Riverpod работал
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
      debugShowCheckedModeBanner: false, //
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Golos Text',
      ),
      home: const HomeScreen(),
    );
  }
}