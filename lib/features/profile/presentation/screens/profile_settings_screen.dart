import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vivere_mobile/core/presentation/utils/app_validators.dart';
import 'package:vivere_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:vivere_mobile/core/domain/value_objects/app_value_objects.dart';
import 'package:vivere_mobile/features/profile/domain/value_objects/physical_parameters.dart';
import 'package:intl/intl.dart';
import '../providers/profile_notifier.dart';
import '../../domain/entities/user_profile.dart';

class ProfileSettingsScreen extends ConsumerWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = statusBarHeight + 56;

    return authState.maybeWhen(
      authenticated: (user) {
        final profileAsync = ref.watch(profileNotifierProvider(user.id));
        const bool hasNotifications = false;

        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: profileAsync.when(
            data: (profile) => Stack(
              children: [
                Positioned.fill(
                  child: _SettingsContent(
                    profile: profile,
                    headerHeight: appBarHeight,
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: appBarHeight + 45,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFF6F6F6),
                          const Color(0xFFF6F6F6),
                          const Color(0xFFF6F6F6),
                          const Color(0xFFF6F6F6).withOpacity(0.98),
                          const Color(0xFFF6F6F6).withOpacity(0.78),
                          const Color(0xFFF6F6F6).withOpacity(0.45),
                          const Color(0xFFF6F6F6).withOpacity(0.16),
                          const Color(0xFFF6F6F6).withOpacity(0.0),
                        ],
                        stops: const [0.0, 0.4, 0.65, 0.72, 0.80, 0.88, 0.95, 1.0],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    bottom: false,
                    child: SizedBox(
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE2E2E2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/back.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Настройки",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            /* Мне кажется уведомления не должны быть в настройках
                            Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE2E2E2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  hasNotifications ? 'assets/icons/notify_on.svg' : 'assets/icons/notify.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ), */
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

class _SettingsContent extends ConsumerStatefulWidget {
  final UserProfile profile;
  final double headerHeight;

  const _SettingsContent({
    required this.profile,
    required this.headerHeight,
  });

  @override
  ConsumerState<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends ConsumerState<_SettingsContent> {
  late UserProfile _editedProfile;

  @override
  void initState() {
    super.initState();
    _editedProfile = widget.profile;
  }

  String _getAgeString(int age) {
    int lastDigit = age % 10;
    int lastTwoDigits = age % 100;
    if (lastTwoDigits >= 11 && lastTwoDigits <= 14) return "$age лет";
    if (lastDigit == 1) return "$age год";
    if (lastDigit >= 2 && lastDigit <= 4) return "$age года";
    return "$age лет";
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

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text("Удаление аккаунта"),
        content: const Text("Вы уверены, что хотите удалить свой аккаунт? Это действие нельзя будет отменить."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Отмена", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await ref.read(profileNotifierProvider(widget.profile.id).notifier).deleteAccount();
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ошибка при удалении: $e'), backgroundColor: Colors.red),
                  );
                }
              }
            },
            child: const Text("Удалить", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showEditDialog({
    required String title,
    required String initialValue,
    required Function(String) onConfirm,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            autofocus: true,
            validator: validator,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE2E2E2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              errorStyle: const TextStyle(color: Color(0xFFFF5900)),
              border: OutlineInputBorder(
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
                borderSide: const BorderSide(color: Color(0xFFFF5900), width: 2),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Отмена", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onConfirm(controller.text);
                Navigator.pop(context);
                setState(() {});
              }
            },
            child: const Text("ОК", style: TextStyle(color: Color(0xFFFF5900), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(24, widget.headerHeight + 24, 24, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const CircleAvatar(
                  radius: 54,
                  backgroundImage: AssetImage("assets/images/programs/workout_1.png"),
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
          const SizedBox(height: 28),

          _InfoBlock(
            label: "Имя",
            value: "${_editedProfile.firstName.value} ${_editedProfile.lastName.value}",
            onTap: () => _showEditDialog(
              title: "Изменить имя и фамилию",
              initialValue: "${_editedProfile.firstName.value} ${_editedProfile.lastName.value}",
              validator: (val) {
                if (val == null || val.isEmpty) return 'Введите имя и фамилию';
                final names = val.trim().split(' ');
                if (names.length < 2) return 'Введите фамилию через пробел';
                final nameError = AppValidators.name(names[0]);
                if (nameError != null) return nameError;
                final lastNameError = AppValidators.lastName(names.sublist(1).join(' '));
                if (lastNameError != null) return lastNameError;
                return null;
              },
              onConfirm: (val) {
                final names = val.trim().split(' ');
                _editedProfile = _editedProfile.copyWith(
                  firstName: Name(names.first),
                  lastName: Name(names.length > 1 ? names.sublist(1).join(' ') : ''),
                );
              },
            ),
          ),
          _InfoBlock(
            label: "Вес",
            value: "${_editedProfile.weight.value.toInt()} кг",
            onTap: () => _showEditDialog(
              title: "Изменить вес",
              initialValue: _editedProfile.weight.value.toInt().toString(),
              keyboardType: TextInputType.number,
              validator: (val) => AppValidators.number(val, min: 30, max: 300),
              onConfirm: (val) {
                final normalized = val.replaceAll(',', '.');
                final weightVal = double.tryParse(normalized) ?? _editedProfile.weight.value;
                _editedProfile = _editedProfile.copyWith(weight: Weight(weightVal));
              },
            ),
          ),
          _InfoBlock(
            label: "Рост",
            value: "${_editedProfile.height.value.toInt()} см",
            onTap: () => _showEditDialog(
              title: "Изменить рост",
              initialValue: _editedProfile.height.value.toInt().toString(),
              keyboardType: TextInputType.number,
              validator: (val) => AppValidators.number(val, min: 100, max: 250),
              onConfirm: (val) {
                final normalized = val.replaceAll(',', '.');
                final heightVal = double.tryParse(normalized) ?? _editedProfile.height.value;
                _editedProfile = _editedProfile.copyWith(height: Height(heightVal));
              },
            ),
          ),
          _InfoBlock(
            label: "Возраст",
            value: _getAgeString(_editedProfile.age.value),
            onTap: () => _showEditDialog(
              title: "Изменить дату рождения",
              initialValue: DateFormat('dd.MM.yyyy').format(_editedProfile.birthDate),
              keyboardType: TextInputType.number,
              inputFormatters: [
                _DateInputFormatter(),
                LengthLimitingTextInputFormatter(10),
              ],
              validator: AppValidators.date,
              onConfirm: (val) {
                final newAge = _calculateAge(val);
                final parts = val.split('.');
                final newBirthDate = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
                _editedProfile = _editedProfile.copyWith(
                  age: Age(newAge),
                  birthDate: newBirthDate,
                );
              },
            ),
          ),
          _InfoBlock(label: "Статус", value: "Участник сообщества"),
          _InfoBlock(
            label: "Почта",
            value: _editedProfile.email.value,
            onTap: () => _showEditDialog(
              title: "Изменить почту",
              initialValue: _editedProfile.email.value,
              keyboardType: TextInputType.emailAddress,
              validator: AppValidators.email,
              onConfirm: (val) => _editedProfile = _editedProfile.copyWith(email: Email(val)),
            ),
          ),
          _InfoBlock(
            label: "Логин",
            value: _editedProfile.nickName.value,
            onTap: () => _showEditDialog(
              title: "Изменить логин",
              initialValue: _editedProfile.nickName.value,
              validator: AppValidators.nickName,
              onConfirm: (val) => _editedProfile = _editedProfile.copyWith(nickName: NickName(val)),
            ),
          ),
          _InfoBlock(label: "Пароль", value: "**********"),

          const SizedBox(height: 24),

          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 352),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await ref.read(profileNotifierProvider(_editedProfile.id).notifier).saveProfile(_editedProfile);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Изменения сохранены'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5900),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ),
                      child: const Text('Сохранить', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _showDeleteConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF727272),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ),
                      child: const Text('Удалить профиль', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;
  const _InfoBlock({required this.label, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length < oldValue.text.length) return newValue;
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if (i == 1 || i == 3) {
        if (i < digits.length) buffer.write('.');
      }
    }
    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted.length > 10 ? formatted.substring(0, 10) : formatted,
      selection: TextSelection.collapsed(offset: formatted.length > 10 ? 10 : formatted.length),
    );
  }
}