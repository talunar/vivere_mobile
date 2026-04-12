import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход в Vivere'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fitness_center, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Добро пожаловать!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Пока просто заглушка кнопки
              },
              child: const Text('Войти через Google'),
            ),
          ],
        ),
      ),
    );
  }
}