import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_button.dart';
import 'package:vivere_mobile/core/domain/entities/gender.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_text_field.dart';
import '../../../../core/presentation/utils/app_validators.dart';
import '../../../../core/presentation/utils/date_input_formatter.dart';
import '../providers/auth_provider.dart';
import '../state/auth_state.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController dobController;
  late final TextEditingController weightController;
  late final TextEditingController heightController;
  Gender selectedGender = Gender.male;

  @override
  void initState() {
    super.initState();
    dobController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  void dispose() {
    dobController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  int _calculateAge(String dob) {
    try {
      final parts = dob.split('.');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      final birthDate = DateTime(year, month, day);
      final today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return 0;
    }
  }

  void _onComplete() {
    if (_formKey.currentState?.validate() ?? false) {
      final weightDouble = double.tryParse(weightController.text.replaceAll(',', '.')) ?? 0.0;
      final heightDouble = double.tryParse(heightController.text.replaceAll(',', '.')) ?? 0.0;

      ref.read(authControllerProvider.notifier).completeRegistration(
        age: _calculateAge(dobController.text),
        weight: weightDouble.round(),
        height: heightDouble.round(),
        birthDate: dobController.text,
        gender: selectedGender,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

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
                              'Финиш',
                              style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w900,
                                height: 1.0,
                                color: Color(0xFF141414),
                              ),
                            ),
                            const Spacer(flex: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _GenderButton(
                                  label: 'Мужчина',
                                  isSelected: selectedGender == Gender.male,
                                  onTap: () => setState(() => selectedGender = Gender.male),
                                ),
                                _GenderButton(
                                  label: 'Женщина',
                                  isSelected: selectedGender == Gender.female,
                                  onTap: () => setState(() => selectedGender = Gender.female),
                                ),
                                _GenderButton(
                                  label: 'Другое',
                                  isSelected: selectedGender == Gender.other,
                                  onTap: () => setState(() => selectedGender = Gender.other),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            AppTextField(
                              controller: dobController,
                              hintText: 'Дата рождения',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                DateInputFormatter(),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: AppValidators.date,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: weightController,
                              hintText: 'Вес',
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              validator: (v) => AppValidators.number(v, min: 20, max: 255),
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: heightController,
                              hintText: 'Рост',
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              validator: (v) => AppValidators.number(v, min: 50, max: 250),
                            ),
                            const SizedBox(height: 32),
                            authState.maybeMap(
                              loading: (_) => const Center(
                                child: CircularProgressIndicator(color: Color(0xFFFF5900)),
                              ),
                              orElse: () => AppButton(
                                text: 'Зарегистрироваться',
                                onPressed: _onComplete,
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

class _GenderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? const Color(0xFFFF5900) : const Color(0xFF9E9E9E),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 6),
          if (isSelected)
            Container(
              width: 44,
              height: 2.5,
              color: const Color(0xFFFF5900),
            ),
        ],
      ),
    );
  }
}
