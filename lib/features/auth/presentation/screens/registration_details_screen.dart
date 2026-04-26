import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class RegistrationDetailsScreen extends ConsumerStatefulWidget {
  const RegistrationDetailsScreen({super.key});

  @override
  ConsumerState<RegistrationDetailsScreen> createState() => _RegistrationDetailsScreenState();
}

class _RegistrationDetailsScreenState extends ConsumerState<RegistrationDetailsScreen> {
  // Контроллеры
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О вас'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
              'Давайте познакомимся',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 20),
          TextField(
              controller: fNameController,
              decoration: const InputDecoration(labelText: 'Имя')
          ),
          const SizedBox(height: 12),
          TextField(
              controller: lNameController,
              decoration: const InputDecoration(labelText: 'Фамилия')
          ),
          const SizedBox(height: 12),
          TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email')
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              ref.read(authControllerProvider.notifier).submitNameAndEmail(
                firstName: fNameController.text,
                lastName: lNameController.text,
                email: emailController.text,
              );
            },
            child: const Text('К параметрам тела'),
          ),
        ],
      ),
    );
  }
}