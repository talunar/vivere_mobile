import 'package:flutter/material.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = TextEditingController();
    final passController = TextEditingController();
    // Слушаем состояние для отображения индикатора загрузки
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Vivere', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300, letterSpacing: 2)),
            const SizedBox(height: 40),
            TextField(controller: loginController, decoration: const InputDecoration(labelText: 'Логин')),
            TextField(controller: passController, obscureText: true, decoration: const InputDecoration(labelText: 'Пароль')),
            const SizedBox(height: 24),
            if (authState is AuthLoading)
              const Center(child: CircularProgressIndicator())
            else
              ElevatedButton(
                onPressed: () => ref.read(authControllerProvider.notifier)
                    .continueToNextStep(loginController.text, passController.text),
                child: const Text('Продолжить'),
              ),
          ],
        ),
      ),
    );
  }
}