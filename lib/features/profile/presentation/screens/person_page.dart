import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/domain/failures/failure.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_notifier.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/value_objects/physical_parameters.dart';

class PersonPage extends ConsumerWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    
    return authState.maybeWhen(
      authenticated: (user) {
        final profileAsync = ref.watch(profileNotifierProvider(user.id));
        
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("Профиль", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                onPressed: () => ref.read(authControllerProvider.notifier).logout(),
                tooltip: 'Выйти',
              )
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/auth_page.jpg"), 
                fit: BoxFit.cover, 
                opacity: 0.4,
              ),
            ),
            child: profileAsync.when(
              data: (profile) => _ProfileContent(profile: profile),
              loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 60),
                      const SizedBox(height: 16),
                      Text('Ошибка: $err', textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(profileNotifierProvider(user.id)),
                        child: const Text("Повторить"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      orElse: () => const Scaffold(
        body: Center(child: Text('Пользователь не авторизован')),
      ),
    );
  }
}

class _ProfileContent extends ConsumerStatefulWidget {
  final UserProfile profile;
  const _ProfileContent({required this.profile});

  @override
  ConsumerState<_ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<_ProfileContent> {
  late TextEditingController _nickNameController;
  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;

  @override
  void initState() {
    super.initState();
    _nickNameController = TextEditingController(text: widget.profile.nickName);
    _emailController = TextEditingController(text: widget.profile.email);
    _firstNameController = TextEditingController(text: widget.profile.firstName);
    _lastNameController = TextEditingController(text: widget.profile.lastName);
    _ageController = TextEditingController(text: widget.profile.age.toString());
    _weightController = TextEditingController(text: widget.profile.weight.value.toString());
    _heightController = TextEditingController(text: widget.profile.height.value.toString());
  }

  @override
  void dispose() {
    _nickNameController.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final updatedProfile = widget.profile.copyWith(
      nickName: _nickNameController.text.trim(),
      email: _emailController.text.trim(),
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      age: int.tryParse(_ageController.text) ?? widget.profile.age,
      weight: Weight(double.tryParse(_weightController.text) ?? widget.profile.weight.value),
      height: Height(double.tryParse(_heightController.text) ?? widget.profile.height.value),
    );

    await ref.read(profileNotifierProvider(widget.profile.id).notifier)
        .saveProfile(updatedProfile);
    
    final finalState = ref.read(profileNotifierProvider(widget.profile.id));
    if (finalState.hasError && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(finalState.error.toString()), backgroundColor: Colors.red),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Профиль успешно обновлен'), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSaving = ref.watch(profileNotifierProvider(widget.profile.id)).isLoading;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Личные данные", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildField(_nickNameController, "Никнейм"),
              _buildField(_emailController, "Email", keyboardType: TextInputType.emailAddress),
              _buildField(_firstNameController, "Имя"),
              _buildField(_lastNameController, "Фамилия"),
              Row(
                children: [
                  Expanded(child: _buildField(_ageController, "Возраст", keyboardType: TextInputType.number)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildField(_weightController, "Вес (кг)", keyboardType: TextInputType.number)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildField(_heightController, "Рост (см)", keyboardType: TextInputType.number)),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Дата рождения: ${DateFormat('dd.MM.yyyy').format(widget.profile.birthDate)}",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              if (isSaving)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFFFF5900),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("СОХРАНИТЬ"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
