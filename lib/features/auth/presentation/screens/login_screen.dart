import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../state/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // Контроллеры
  late final TextEditingController loginController;
  late final TextEditingController passController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    loginController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Слушаем состояние
    final authState = ref.watch(authControllerProvider);

    // Обработка ошибок (показываем SnackBar, если пришла ошибка)
    ref.listen(authControllerProvider, (previous, next) {
      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
                'Vivere',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300, letterSpacing: 2)
            ),
            const SizedBox(height: 40),
            TextField(
                controller: loginController,
                decoration: const InputDecoration(labelText: 'Логин')
            ),
            TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Пароль')
            ),
            const SizedBox(height: 24),

            authState.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => ElevatedButton(
                onPressed: () {
                  ref.read(authControllerProvider.notifier).continueToNextStep(
                    loginController.text,
                    passController.text,
                  );
                },
                child: const Text('Продолжить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}