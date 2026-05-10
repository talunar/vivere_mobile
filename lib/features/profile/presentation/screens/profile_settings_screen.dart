import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_notifier.dart';
import '../../domain/entities/user_profile.dart';

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
            toolbarHeight: 80,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Center(child: _NotificationIcon()),
            ),
            leadingWidth: 70,
            title: const Text(
              "Настройки",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 24,
                fontFamily: 'Golos Text',
              ),
            ),
            centerTitle: true,
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
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFE2E2E2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.notifications_none, color: Colors.black, size: 30),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // Аватар
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 54,
                  backgroundImage: AssetImage("assets/design/workout_1.png"),
                ),
                Positioned(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 18, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          _InfoBlock(label: "Имя", value: "${widget.profile.firstName} ${widget.profile.lastName}", isBold: true),
          _InfoBlock(label: "Вес", value: "${widget.profile.weight.value.toInt()} кг", isBold: true),
          _InfoBlock(label: "Рост", value: "${widget.profile.height.value.toInt()} см", isBold: true),
          _InfoBlock(label: "Возраст", value: "${widget.profile.age} лет", isBold: true),
          _InfoBlock(label: "Статус", value: "Участник сообщества", isBold: true),
          _InfoBlock(label: "Почта", value: widget.profile.email),
          _InfoBlock(label: "Логин", value: widget.profile.nickName),
          _InfoBlock(label: "Пароль", value: "**********"),

          const SizedBox(height: 32),

          // Мои покупки
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E2E2),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Мои покупки",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, fontFamily: 'Golos Text'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "8 тренировок",
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Golos Text'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 28),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          Center(
            child: TextButton(
              onPressed: () => ref.read(authControllerProvider.notifier).logout(),
              child: const Text(
                "Выйти из аккаунта",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  const _InfoBlock({required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 16, fontFamily: 'Golos Text'),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: isBold ? FontWeight.w400 : FontWeight.w400,
              fontFamily: 'Golos Text',
              color: Colors.black,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}