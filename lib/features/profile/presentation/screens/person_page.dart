import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../workout/domain/entities/workout_program.dart';
import '../../../workout/presentation/screens/program_details_screen.dart';
import '../../../workout/presentation/providers/workout_providers.dart';
import '../../../workout/presentation/screens/calendar_screen.dart';
import '../providers/profile_notifier.dart';
import '../../domain/entities/user_profile.dart';

class PersonPage extends ConsumerWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headerHeight = statusBarHeight + 56;

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
                  child: _ProfileDashboard(profile: profile),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: headerHeight + 45,
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
                      ),
                    ),
                  ),
                ),
              ],
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

  const _ProfileDashboard({required this.profile});

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
    final now = DateTime.now();
    final monthName = DateFormat('MMMM', 'ru_RU').format(now);
    final capitalizedMonth = monthName[0].toUpperCase() + monthName.substring(1);

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, topPadding + 56 + 24, 16, 120),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage("assets/images/programs/workout_1.png"),
          ),
          const SizedBox(height: 12),

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
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
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
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 2.5,
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
            title: capitalizedMonth,
            showArrow: true,
            onArrowTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalendarScreen()),
              );
            },
            child: programsAsync.maybeWhen(
              data: (programs) => _WeekCalendar(hasWorkouts: programs.isNotEmpty),
              orElse: () => const _WeekCalendar(hasWorkouts: false),
            ),
          ),
          const SizedBox(height: 16),

          _DashboardCard(
            title: "Мои тренировки",
            showArrow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                programsAsync.maybeWhen(
                  data: (programs) => Text(
                    "${programs.length} штук",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  orElse: () => const Text("0 штук", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
                const Text(
                  "4 приобретено",
                  style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          programsAsync.when(
            data: (programs) {
              if (programs.isEmpty) return const SizedBox.shrink();
              return _DashboardCard(
                title: "Текущие программы",
                showAdd: true,
                child: Column(
                  children: programs.asMap().entries.map((entry) {
                    final index = entry.key;
                    final program = entry.value;
                    final isLast = index == programs.length - 1;

                    return Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
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
                    );
                  }).toList(),
                ),
              );
            },
            loading: () => const _DashboardCard(
              title: "Текущие программы",
              child: Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
            ),
            error: (err, _) => Text('Ошибка загрузки программ: $err'),
          ),
        ],
      ),
    );
  }
}

class _WeekCalendar extends StatelessWidget {
  final bool hasWorkouts;
  const _WeekCalendar({required this.hasWorkouts});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final date = startOfWeek.add(Duration(days: index));
        final isToday = date.day == now.day && date.month == now.month;

        // Логика подчеркивания: только вторник (2) и четверг (4)
        final bool shouldUnderline = hasWorkouts && (date.weekday == DateTime.tuesday || date.weekday == DateTime.thursday);

        return Column(
          children: [
            Text(
              days[index],
              style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              "${date.day}",
              style: TextStyle(
                color: isToday ? const Color(0xFFFF5900) : const Color(0xFF141414),
                fontWeight: isToday ? FontWeight.bold : FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 20,
              height: 2,
              color: shouldUnderline ? const Color(0xFFFF5900) : Colors.transparent,
            ),
          ],
        );
      }),
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
        width: 44,
        height: 44,
        decoration: const BoxDecoration(color: Color(0xFFE2E2E2), shape: BoxShape.circle),
        child: Center(
          child: SvgPicture.asset(
            asset,
            width: 44,
            height: 44,
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
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
  final VoidCallback? onArrowTap;

  const _DashboardCard({
    required this.title,
    required this.child,
    this.showAdd = false,
    this.showArrow = false,
    this.onArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Внутренние отступы: 12 (бока), 16 (верх), 24 (низ)
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
      decoration: BoxDecoration(color: const Color(0xFFE2E2E2), borderRadius: BorderRadius.circular(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                if (showAdd) const Icon(Icons.add_circle, size: 36, color: Colors.black),
                if (showArrow)
                  GestureDetector(
                    onTap: onArrowTap,
                    behavior: HitTestBehavior.opaque,
                    child: const Icon(Icons.arrow_circle_right, size: 36, color: Colors.black),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Добавлен отступ 4, чтобы контент начинался ровно под заголовком
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: child,
          ),
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
    return Row(
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
        Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
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
