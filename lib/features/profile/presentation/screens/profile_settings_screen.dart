import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_notifier.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/value_objects/physical_parameters.dart';

class ProfileSettingsScreen extends ConsumerWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        final profileAsync = ref.watch(profileNotifierProvider(user.id));
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              "Настройки",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              _NotificationIcon(),
              const SizedBox(width: 8),
            ],
          ),
          body: profileAsync.when(
            data: (profile) => _SettingsContent(profile: profile),
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
            error: (err, _) => Center(child: Text('Ошибка: $err')),
          ),
        );
      },
      orElse: () => const Scaffold(body: Center(child: Text('Пользователь не авторизован'))),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Используем notify.svg или стандартную иконку если файла нет
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFE2E2E2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.notifications_none, color: Colors.black, size: 20),
        onPressed: () {},
      ),
    );
  }
}

class _SettingsContent extends ConsumerStatefulWidget {
  final UserProfile profile;
  const _SettingsContent({required this.profile});

  @override
  ConsumerState<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends ConsumerState<_SettingsContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Аватар с кнопкой редактирования
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/design/workout_1.png"), // Используется локальный файл
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          _InfoBlock(label: "Имя", value: "${widget.profile.firstName} ${widget.profile.lastName}"),
          _InfoBlock(label: "Вес", value: "${widget.profile.weight.value.toInt()} кг"),
          _InfoBlock(label: "Рост", value: "${widget.profile.height.value.toInt()} см"),
          _InfoBlock(label: "Возраст", value: "${widget.profile.age} года"),
          _InfoBlock(label: "Статус", value: "Участник сообщества"),
          _InfoBlock(label: "Почта", value: widget.profile.email),
          _InfoBlock(label: "Логин", value: widget.profile.nickName ?? ""),
          _InfoBlock(label: "Пароль", value: "*********"),

          const SizedBox(height: 32),
          
          // Мои покупки (мок)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E2E2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Мои покупки",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "8 тренировок",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          
          TextButton(
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            child: const Text(
              "Выйти из аккаунта",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label;
  final String value;
  const _InfoBlock({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
