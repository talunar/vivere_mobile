import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../state/auth_state.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  late final TextEditingController ageController;
  late final TextEditingController weightController;
  late final TextEditingController heightController;
  Gender selectedGender = Gender.male;

  @override
  void initState() {
    super.initState();
    ageController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      const Text(
                        'Финиш',
                        style: TextStyle(
                          fontSize: 64, // Увеличенный заголовок
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          fontFamily: 'Golos Text',
                          color: Color(0xFF141414),
                        ),
                      ),
                      const Spacer(flex: 2), // Центрирование
                      
                      // Выбор пола
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
                      
                      _CustomTextField(
                        controller: ageController,
                        hintText: 'Возраст',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      _CustomTextField(
                        controller: weightController,
                        hintText: 'Вес',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      _CustomTextField(
                        controller: heightController,
                        hintText: 'Рост',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 32),
                      
                      authState.maybeMap(
                        loading: (_) => const Center(
                          child: CircularProgressIndicator(color: Color(0xFFFF5900)),
                        ),
                        orElse: () => ElevatedButton(
                          onPressed: () {
                            ref.read(authControllerProvider.notifier).completeRegistration(
                              age: int.tryParse(ageController.text) ?? 0,
                              weight: double.tryParse(weightController.text) ?? 0.0,
                              height: double.tryParse(heightController.text) ?? 0.0,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5900),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 64), // Увеличенная кнопка
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                              fontSize: 20, // Увеличенный текст кнопки
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
              fontSize: 20, // Чуть больше текст
              fontFamily: 'Golos Text',
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

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;

  const _CustomTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE2E2E2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 18, fontFamily: 'Golos Text'), // Увеличенный текст
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
