import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_button.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_text_field.dart';
import '../../../../core/presentation/utils/app_validators.dart';
import '../providers/auth_provider.dart';
import '../state/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authControllerProvider.notifier).continueToNextStep(
            loginController.text.trim(),
            passController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message), 
            backgroundColor: const Color(0xFFFF5900),
          ),
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
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 352),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
                            const Text(
                              'Готовы\nк новому\nуровню?',
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w900,
                                height: 1.0,
                                color: Color(0xFF141414),
                              ),
                            ),
                            const Spacer(flex: 2),
                            AppTextField(
                              controller: loginController,
                              hintText: 'Логин',
                              validator: AppValidators.nickName,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: passController,
                              hintText: 'Пароль',
                              isPassword: true,
                              isObscured: isObscured,
                              onToggleObscure: () => setState(() => isObscured = !isObscured),
                              validator: AppValidators.password,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _onLogin(),
                            ),
                            const SizedBox(height: 32),
                            authState.maybeMap(
                              loading: (_) => const Center(
                                child: CircularProgressIndicator(color: Color(0xFFFF5900)),
                              ),
                              orElse: () => AppButton(
                                text: 'Войти',
                                onPressed: _onLogin,
                                variant: AppButtonVariant.primary,
                              ),
                            ),
                            const Spacer(flex: 3),
                          ],
                        ),
                      ),
                    ),
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
