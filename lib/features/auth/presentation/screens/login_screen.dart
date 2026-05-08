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
  late final TextEditingController loginController;
  late final TextEditingController passController;
  bool isObscured = true;

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
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      const Text(
                        'Готовы\nк новому\nуровню?',
                        style: TextStyle(
                          fontSize: 64, // Увеличили текст
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          fontFamily: 'Golos Text',
                          color: Color(0xFF141414),
                        ),
                      ),
                      const Spacer(flex: 2), // Центрируем контент
                      _CustomTextField(
                        controller: loginController,
                        hintText: 'Логин',
                      ),
                      const SizedBox(height: 16),
                      _CustomTextField(
                        controller: passController,
                        hintText: 'Пароль',
                        isPassword: true,
                        isObscured: isObscured,
                        onToggleObscure: () => setState(() => isObscured = !isObscured),
                      ),
                      const SizedBox(height: 32),
                      authState.maybeMap(
                        loading: (_) => const Center(
                          child: CircularProgressIndicator(color: Color(0xFFFF5900)),
                        ),
                        orElse: () => ElevatedButton(
                          onPressed: () {
                            ref.read(authControllerProvider.notifier).continueToNextStep(
                              loginController.text.trim(),
                              passController.text.trim(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5900),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 64), // Увеличили кнопку
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Войти',
                            style: TextStyle(
                              fontSize: 20, // Увеличили текст кнопки
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Golos Text',
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isObscured;
  final VoidCallback? onToggleObscure;

  const _CustomTextField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.isObscured = false,
    this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE2E2E2),
        borderRadius: BorderRadius.circular(20), // Больше скругление
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && isObscured,
        style: const TextStyle(fontSize: 18, fontFamily: 'Golos Text'), // Больше текст
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: const Color(0xFF9E9E9E),
                  ),
                  onPressed: onToggleObscure,
                )
              : null,
        ),
      ),
    );
  }
}
