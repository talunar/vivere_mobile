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
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: SafeArea(
            bottom: false,
            child: profileAsync.when(
              data: (profile) => _ProfileDashboard(profile: profile),
              loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
              error: (err, _) => Center(child: Text('Ошибка: $err')),
            ),
          ),
        );
      },
      orElse: () => const Scaffold(body: Center(child: Text('Пользователь не авторизован'))),
    );
  }
}

class _ProfileDashboard extends ConsumerWidget {
  final UserProfile profile;
  const _ProfileDashboard({required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Слушаем провайдер программ пользователя (сгенерирован из класса UserPrograms)
    final programsAsync = ref.watch(userProgramsProvider(profile.id.value));

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 120),
      child: Column(
        children: [
          // Top Bar
          Row(
            children: [
              const _IconBtn(asset: 'assets/icons/notify.svg', fallback: Icons.notifications_none),
              const SizedBox(width: 8),
              const _IconBtn(asset: 'assets/icons/chat.svg', fallback: Icons.chat_bubble_outline),
              const Spacer(),
              _IconBtn(
                asset: 'assets/icons/settings.svg',
                fallback: Icons.settings_outlined,
                onTap: () => context.push('/profile_settings'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Avatar & Name
          const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage("assets/design/workout_1.png"),
          ),
          const SizedBox(height: 16),
          Text(
            "${profile.firstName} ${profile.lastName}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Text(
            "Участник сообщества",
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
          ),
          const SizedBox(height: 32),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(label: "Вес", value: "${profile.weight.value.toInt()} кг", icon: Icons.fitness_center),
              _StatItem(label: "Рост", value: "${profile.height.value.toInt()} см", icon: Icons.height),
              _StatItem(label: "Возраст", value: "${profile.age}", icon: Icons.person_outline),
            ],
          ),
          const SizedBox(height: 32),

          // Cards Feed
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
            title: "Март",
            showArrow: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(7, (i) => _CalendarDay(day: 24 + i, isSelected: i == 0)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          _DashboardCard(
            title: "Мои тренировки",
            showArrow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("8 штук", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("4 приобретено", style: TextStyle(color: Colors.black54, fontSize: 14)),
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
                      // Вызываем удаление через нотификатор
                      ref.read(userProgramsProvider(profile.id.value).notifier).deleteProgram(program.id);
                    },
                  ),
                )).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
              error: (err, _) => Text('Ошибка загрузки программ: $err'),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final String asset;
  final IconData fallback;
  final VoidCallback? onTap;
  const _IconBtn({required this.asset, required this.fallback, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(color: Color(0xFFE2E2E2), shape: BoxShape.circle),
        padding: const EdgeInsets.all(4),
        child: Center(
          child: SvgPicture.asset(
            asset,
            width: 48,
            height: 48,
            fit: BoxFit.contain,
            placeholderBuilder: (_) => Icon(fallback, size: 48, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _StatItem({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFFFF5900), size: 40),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
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
              Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
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
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
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
        Text(value, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
      ],
    );
  }
}

class _CalendarDay extends StatelessWidget {
  final int day;
  final bool isSelected;
  const _CalendarDay({required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          const Text("Пн", style: TextStyle(color: Colors.black54, fontSize: 14)),
          const SizedBox(height: 6),
          Text("$day", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? const Color(0xFFFF5900) : Colors.black,
          )),
          const SizedBox(height: 4),
          if (isSelected) Container(width: 24, height: 3, color: const Color(0xFFFF5900)),
        ],
      ),
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
                    "assets/design/workout_1.png",
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
                            fontFamily: 'Golos Text',
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
                              backgroundImage: AssetImage("assets/design/workout_1.png"),
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
