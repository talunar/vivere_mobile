import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../workout/domain/entities/workout_program.dart';
import '../../../workout/presentation/screens/program_details_screen.dart';
import '../../../workout/presentation/providers/workout_providers.dart';
import '../providers/profile_notifier.dart';
import '../../domain/entities/user_profile.dart';

class PersonPage extends ConsumerWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        final profileAsync = ref.watch(profileNotifierProvider(user.id));
        const bool hasNotifications = false;

        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          // AppBar удален, чтобы иконки прокручивались вместе с контентом
          body: profileAsync.when(
            data: (profile) => _ProfileDashboard(
              profile: profile,
              hasNotifications: hasNotifications,
            ),
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
            error: (err, _) => Center(child: Text('Ошибка: $err')),
          ),
        );
      },
      orElse: () => const Scaffold(body: Center(child: Text('Пользователь не авторизован'))),
    );
  }
}

class _ProfileDashboard extends ConsumerWidget {
  final UserProfile profile;
  final bool hasNotifications;
  
  const _ProfileDashboard({
    required this.profile,
    required this.hasNotifications,
  });

  String _getAgeString(int age) {
    int lastDigit = age % 10;
    int lastTwoDigits = age % 100;
    if (lastTwoDigits >= 11 && lastTwoDigits <= 14) return "$age лет";
    if (lastDigit == 1) return "$age год";
    if (lastDigit >= 2 && lastDigit <= 4) return "$age года";
    return "$age лет";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programsAsync = ref.watch(userProgramsProvider(profile.id.value));
    final double topPadding = MediaQuery.of(context).padding.top;

    return SingleChildScrollView(

      padding: EdgeInsets.fromLTRB(20, topPadding + 10, 20, 120),
      child: Column(
        children: [
          Row(
            children: [
              _IconBtn(
                asset: hasNotifications ? 'assets/icons/notify_on.svg' : 'assets/icons/notify.svg',
              ),
              const SizedBox(width: 8),
              const _IconBtn(asset: 'assets/icons/chat.svg'),
              const Spacer(),
              _IconBtn(
                asset: 'assets/icons/settings.svg',
                onTap: () => context.push('/profile_settings'),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Аватар
          const CircleAvatar(
            radius: 64, 
            backgroundImage: AssetImage("assets/images/avatar/workout_1.png"),
          ),
          const SizedBox(height: 12),
          
          // Имя и статус
          Text(
            "${profile.firstName.value} ${profile.lastName.value}",
            style: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.w700,
              color: Color(0xFF141414),
            ),
          ),
          const Text(
            "Участник сообщества",
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16, fontFamily: 'Golos Text'),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(
                label: "Вес", 
                value: "${profile.weight.value.toInt()} кг", 
                asset: 'assets/icons/weight.svg',
              ),
              _StatItem(
                label: "Рост", 
                value: "${profile.height.value.toInt()} см", 
                asset: 'assets/icons/height.svg',
              ),
              _StatItem(
                label: "Возраст", 
                value: _getAgeString(profile.age.value), 
                asset: 'assets/icons/profile.svg',
              ),
            ],
          ),
          const SizedBox(height: 22),

          _DashboardCard(
            title: "Цели на сегодня",
            showAdd: true,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                _GoalItem(title: "3 км", subtitle: "Бег", isDone: false),
                _GoalItem(title: "100", subtitle: "Отжимания", isDone: true),
                _GoalItem(title: "100", subtitle: "Подтягивания", isDone: true),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _DashboardCard(
            title: "Калории на сегодня",
            showArrow: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _CalorieItem(label: "Завтрак", value: "320 kkal"),
                _CalorieItem(label: "Обед", value: "220 kkal"),
                _CalorieItem(label: "Ужин", value: "220 kkal"),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _DashboardCard(
            title: "Текущие программы",
            showAdd: true,
            child: programsAsync.when(
              data: (programs) => Column(
                children: programs.map((program) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _ProgramCard(
                    program: program,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgramDetailsScreen(program: program),
                        ),
                      );
                    },
                    onDelete: () {
                      ref.read(userProgramsProvider(profile.id.value).notifier).deleteProgram(program.id);
                    },
                  ),
                )).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
              error: (err, _) => Text('Ошибка загрузки программ: $err', style: const TextStyle(fontFamily: 'Golos Text')),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final String asset;
  final VoidCallback? onTap;
  const _IconBtn({required this.asset, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54, 
        height: 54,
        decoration: const BoxDecoration(color: Color(0xFFE2E2E2), shape: BoxShape.circle),
        child: Center(
          child: SvgPicture.asset(
            asset,
            width: 54, 
            height: 54,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final String asset;
  const _StatItem({required this.label, required this.value, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          asset,
          width: 36,
          height: 36,
          colorFilter: const ColorFilter.mode(
            Color(0xFFFF5900),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Golos Text'),
            ),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14, fontFamily: 'Golos Text'),
            ),
          ],
        ),
      ],
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showAdd;
  final bool showArrow;

  const _DashboardCard({required this.title, required this.child, this.showAdd = false, this.showArrow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFE2E2E2), borderRadius: BorderRadius.circular(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'Golos Text')),
              if (showAdd) const Icon(Icons.add_circle, size: 36, color: Colors.black),
              if (showArrow) const Icon(Icons.arrow_circle_right, size: 36, color: Colors.black),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDone;
  const _GoalItem({required this.title, required this.subtitle, required this.isDone});

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (MediaQuery.of(context).size.width - 40 - 48 - 16) / 2;
    return SizedBox(
      width: itemWidth,
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.circle_outlined,
            color: isDone ? const Color(0xFFFF5900) : Colors.white,
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Golos Text'),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 14, fontFamily: 'Golos Text'),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CalorieItem extends StatelessWidget {
  final String label;
  final String value;
  const _CalorieItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Golos Text')),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14, fontFamily: 'Golos Text')),
      ],
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final WorkoutProgram program;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const _ProgramCard({required this.program, this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/programs/workout_1.png",
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          program.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF141414),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xFFFFB800), size: 16),
                            const SizedBox(width: 5),
                            Text(
                              program.rating?.toString() ?? "4.8",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF141414),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage("assets/images/programs/workout_1.png"),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                program.trainerName ?? "Super train 3000",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: onDelete,
          ),
        ),
      ],
    );
  }
}
