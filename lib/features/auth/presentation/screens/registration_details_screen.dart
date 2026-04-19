import 'package:flutter/material.dart';

class RegistrationDetailsScreen extends ConsumerWidget {
  const RegistrationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fNameController = TextEditingController();
    final lNameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('О вас')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Давайте познакомимся', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          TextField(controller: fNameController, decoration: const InputDecoration(labelText: 'Имя')),
          TextField(controller: lNameController, decoration: const InputDecoration(labelText: 'Фамилия')),
          TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => ref.read(authControllerProvider.notifier).submitNameAndEmail(
              firstName: fNameController.text,
              lastName: lNameController.text,
              email: emailController.text,
            ),
            child: const Text('К параметрам тела'),
          ),
        ],
      ),
    );
  }
}