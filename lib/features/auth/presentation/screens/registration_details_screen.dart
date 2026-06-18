import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_button.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_text_field.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
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
                const SizedBox(height: 40),
                AppTextField(
                  controller: fNameController,
                  hintText: 'Имя',
                  keyboardType: TextInputType.name,
                  validator: AppValidators.name,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: lNameController,
                  hintText: 'Фамилия',
                  keyboardType: TextInputType.name,
                  validator: AppValidators.lastName,
                ),
                const SizedBox(height: 16),
                AppTextField(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}