import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_button.dart';
import '../../../../core/presentation/utils/app_validators.dart';
import '../providers/auth_provider.dart';

class RegistrationDetailsScreen extends ConsumerStatefulWidget {
  const RegistrationDetailsScreen({super.key});

  @override
  ConsumerState<RegistrationDetailsScreen> createState() => _RegistrationDetailsScreenState();
}

class _RegistrationDetailsScreenState extends ConsumerState<RegistrationDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController fNameController;
  late final TextEditingController lNameController;
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authControllerProvider.notifier).submitNameAndEmail(
            firstName: fNameController.text.trim(),
            lastName: lNameController.text.trim(),
            email: emailController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              'Почти\nу цели',
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w900,
                                height: 1.0,
                                color: Color(0xFF141414),
                              ),
                            ),
                            const Spacer(flex: 2),
                            _CustomTextField(
                              controller: fNameController,
                              hintText: 'Имя',
                              keyboardType: TextInputType.name,
                              validator: AppValidators.name,
                            ),
                            const SizedBox(height: 16),
                            _CustomTextField(
                              controller: lNameController,
                              hintText: 'Фамилия',
                              keyboardType: TextInputType.name,
                              validator: AppValidators.lastName,
                            ),
                            const SizedBox(height: 16),
                            _CustomTextField(
                              controller: emailController,
                              hintText: 'Почта',
                              keyboardType: TextInputType.emailAddress,
                              validator: AppValidators.email,
                            ),
                            const SizedBox(height: 32),
                            AppButton(
                              text: 'Продолжить',
                              onPressed: _onContinue,
                              variant: AppButtonVariant.primary,
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

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _CustomTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      style: const TextStyle(fontSize: 18, color: Color(0xFF141414)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        filled: true,
        fillColor: const Color(0xFFE2E2E2),
        constraints: const BoxConstraints(minHeight: 50, maxHeight: 75),
        errorStyle: const TextStyle(color: Color(0xFFFF5900), fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFFFF5900), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFFFF5900), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFFFF5900), width: 1.5),
        ),
      ),
    );
  }
}
