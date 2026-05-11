import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivere_mobile/features/auth/presentation/providers/auth_provider.dart';
import '../providers/profile_notifier.dart';
import '../providers/profile_providers.dart';
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
            toolbarHeight: 80,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(child: _NotificationIcon()),
              ),
            ],
          ),
          body: profileAsync.when(
            data: (profile) => _SettingsContent(profile: profile),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFFFF5900)),
            ),
            error: (err, _) => Center(child: Text('Ошибка: $err')),
          ),
        );
      },
      orElse: () => const Scaffold(
        body: Center(child: Text('Пользователь не авторизован')),
      ),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xFFE2E2E2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.notifications_none, color: Colors.black, size: 24),
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
  late UserProfile _editingProfile;

  @override
  void initState() {
    super.initState();
    _editingProfile = widget.profile;
  }

  void _showEditDialog({
    required String title,
    required String initialValue,
    required Function(String) onSave,
    TextInputType keyboardType = TextInputType.text,
  }) {
    final controller = TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Изменить $title", style: const TextStyle(fontFamily: 'Golos Text')),
        content: TextField(
          controller: controller,
          keyboardType: keyboardType,
          autofocus: true,
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF5900)),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Отмена", style: TextStyle(color: Colors.grey, fontFamily: 'Golos Text')),
          ),
          TextButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text("ОК", style: TextStyle(color: Color(0xFFFF5900), fontFamily: 'Golos Text')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const CircleAvatar(
                  radius: 54,
                  backgroundImage: AssetImage("assets/images/avatar/workout_1.png"),
                ),
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.edit, size: 20, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),

          _InfoBlock(
            label: "Имя",
            value: _editingProfile.firstName,
            isBold: true,
            onTap: () => _showEditDialog(
              title: "Имя",
              initialValue: _editingProfile.firstName,
              onSave: (val) => setState(() => _editingProfile = _editingProfile.copyWith(firstName: val)),
            ),
          ),
          _InfoBlock(
            label: "Фамилия",
            value: _editingProfile.lastName,
            isBold: true,
            onTap: () => _showEditDialog(
              title: "Фамилия",
              initialValue: _editingProfile.lastName,
              onSave: (val) => setState(() => _editingProfile = _editingProfile.copyWith(lastName: val)),
            ),
          ),
          _InfoBlock(
            label: "Вес",
            value: "${_editingProfile.weight.value.toInt()} кг",
            isBold: true,
            onTap: () => _showEditDialog(
              title: "Вес",
              initialValue: _editingProfile.weight.value.toInt().toString(),
              keyboardType: TextInputType.number,
              onSave: (val) {
                final double? weight = double.tryParse(val);
                if (weight != null) {
                  setState(() => _editingProfile = _editingProfile.copyWith(weight: Weight(weight)));
                }
              },
            ),
          ),
          _InfoBlock(
            label: "Рост",
            value: "${_editingProfile.height.value.toInt()} см",
            isBold: true,
            onTap: () => _showEditDialog(
              title: "Рост",
              initialValue: _editingProfile.height.value.toInt().toString(),
              keyboardType: TextInputType.number,
              onSave: (val) {
                final double? height = double.tryParse(val);
                if (height != null) {
                  setState(() => _editingProfile = _editingProfile.copyWith(height: Height(height)));
                }
              },
            ),
          ),
          _InfoBlock(
            label: "Возраст",
            value: "${_editingProfile.age} лет",
            isBold: true,
            onTap: () => _showEditDialog(
              title: "Возраст",
              initialValue: _editingProfile.age.toString(),
              keyboardType: TextInputType.number,
              onSave: (val) {
                final int? age = int.tryParse(val);
                if (age != null) {
                  setState(() => _editingProfile = _editingProfile.copyWith(age: age));
                }
              },
            ),
          ),
          _InfoBlock(label: "Статус", value: "Участник сообщества", isBold: true),
          _InfoBlock(
            label: "Почта",
            value: _editingProfile.email,
            onTap: () => _showEditDialog(
              title: "Почта",
              initialValue: _editingProfile.email,
              keyboardType: TextInputType.emailAddress,
              onSave: (val) => setState(() => _editingProfile = _editingProfile.copyWith(email: val)),
            ),
          ),
          _InfoBlock(label: "Логин", value: _editingProfile.nickName),
          _InfoBlock(label: "Пароль", value: "**********"),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () async {
              await ref.read(profileNotifierProvider(widget.profile.id).notifier).saveProfile(_editingProfile);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Изменения сохранены')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5900),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 60),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Сохранить',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Golos Text'),
            ),
          ),

          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E2E2),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
          const SizedBox(height: 32),

          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () => ref.read(authControllerProvider.notifier).logout(),
                  child: const Text(
                    "Выйти из аккаунта",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Golos Text'),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Удалить аккаунт?", style: TextStyle(fontFamily: 'Golos Text')),
                        content: const Text("Это действие нельзя будет отменить.", style: TextStyle(fontFamily: 'Golos Text')),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Отмена", style: TextStyle(color: Colors.grey, fontFamily: 'Golos Text')),
                          ),
                          TextButton(
                            onPressed: () async {
                              final success = await ref.read(profileRepositoryProvider).deleteProfile(widget.profile.id);
                              if (success && mounted) {
                                Navigator.pop(context); // Закрываем диалог
                                ref.read(authControllerProvider.notifier).logout(); // Выходим
                              }
                            },
                            child: const Text("Удалить", style: TextStyle(color: Colors.red, fontFamily: 'Golos Text')),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Удалить аккаунт",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Golos Text'),
                  ),
                ),
              ],
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
  final VoidCallback? onTap;
  const _InfoBlock({required this.label, required this.value, this.isBold = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 16, fontFamily: 'Golos Text'),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: isBold ? FontWeight.w400 : FontWeight.w400,
                      fontFamily: 'Golos Text',
                      color: Colors.black,
                      height: 1.1,
                    ),
                  ),
                ),
                if (onTap != null)
                  const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
