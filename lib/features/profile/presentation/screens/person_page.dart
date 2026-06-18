import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vivere_mobile/core/presentation/widgets/dashboard_card.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_circle_button.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../workout/domain/entities/workout_program.dart';
import '../../../workout/presentation/screens/program_details_screen.dart';
import '../../../workout/presentation/screens/my_workouts_screen.dart';
import '../../../workout/presentation/providers/workout_providers.dart';
import '../../../workout/presentation/providers/navigation_provider.dart';
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
                  height: headerHeight + 30,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFF6F6F6),
                          const Color(0xFFF6F6F6),
                          const Color(0xFFF6F6F6).withOpacity(0.98),
                          const Color(0xFFF6F6F6).withOpacity(0.78),
                          const Color(0xFFF6F6F6).withOpacity(0.45),
                          const Color(0xFFF6F6F6).withOpacity(0.16),
                          const Color(0xFFF6F6F6).withOpacity(0.0),
                        ],
                        stops: const [0.0, 0.4, 0.65, 0.72, 0.80, 0.88, 0.95],
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
                            AppCircleButton(
                              assetPath: hasNotifications ? 'assets/icons/notify_on.svg' : 'assets/icons/notify.svg',
                              onTap: () {
                              },
                            ),
                            const SizedBox(width: 8),
                            AppCircleButton(
                              assetPath: 'assets/icons/chat.svg',
                              onTap: () {
                              },
                            ),
                            const Spacer(),
                            AppCircleButton(
                              assetPath: 'assets/icons/settings.svg',
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
    final favoritesAsync = ref.watch(favoriteProgramsProvider(profile.id.value));
    final schedule = ref.watch(workoutScheduleProvider);

    final todayWeekday = DateTime.now().weekday;
    final todayWorkouts = schedule[todayWeekday] ?? [];

    final double topPadding = MediaQuery.of(context).padding.top;
    final now = DateTime.now();
    final monthName = DateFormat('MMMM', 'ru_RU').format(now);
    final capitalizedMonth = monthName[0].toUpperCase() + monthName.substring(1);

    final double itemWidth = (MediaQuery.of(context).size.width - 32 - 24 - 8 - 16) / 2;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, topPadding + 56 + 10, 16, 120),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatItem(
                label: "Вес",
                value: "${profile.weight.value.toInt()} кг",
                asset: 'assets/icons/weight.svg',
              ),
              const SizedBox(width: 32),
              _StatItem(
                label: "Рост",
                value: "${profile.height.value.toInt()} см",
                asset: 'assets/icons/height.svg',
              ),
              const SizedBox(width: 32),
              _StatItem(
                label: "Возраст",
                value: _getAgeString(profile.age.value),
                asset: 'assets/icons/profile.svg',
              ),
            ],
          ),
          const SizedBox(height: 22),

          DashboardCard(
            title: "Цели на сегодня",
            showAdd: true,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: itemWidth,
                  child: const _GoalItem(title: "3 км", subtitle: "Бег", isDone: false),
                ),
                SizedBox(
                  width: itemWidth,
                  child: const _GoalItem(title: "100", subtitle: "Отжимания", isDone: true),
                ),
                SizedBox(
                  width: itemWidth,
                  child: const _GoalItem(title: "100", subtitle: "Подтягивания", isDone: true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          DashboardCard(
            title: capitalizedMonth,
            showArrow: true,
            bottomPadding: 24,
            onArrowTap: () {
              ref.read(navigationNotifierProvider.notifier).setIndex(1);
            },
            child: _WeekCalendar(schedule: schedule),
          ),
          const SizedBox(height: 16),

          DashboardCard(
            title: "Мои тренировки",
            showArrow: true,
            bottomPadding: 24,
            onArrowTap: () {
              ref.read(navigationNotifierProvider.notifier).setIndex(2);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                favoritesAsync.maybeWhen(
                  data: (programs) => Text(
                    "${programs.length} тренировок в избранном",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  orElse: () => const Text("Вы ещё не добавили в избранное", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
                const Text(
                  "0 приобретено",
                  style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          DashboardCard(
            title: "Тренировки сегодня",
            showAdd: true,
            onAddTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWorkoutsScreen(
                    onSelect: (selectedProgram) {
                      ref.read(workoutScheduleProvider.notifier).update((state) {
                        final newState = Map<int, List<WorkoutProgram>>.from(state);
                        final dayPrograms = List<WorkoutProgram>.from(newState[todayWeekday] ?? []);

                        if (!dayPrograms.any((p) => p.id == selectedProgram.id)) {
                          dayPrograms.add(selectedProgram);
                          newState[todayWeekday] = dayPrograms;
                        }
                        return newState;
                      });
                    },
                  ),
                ),
              );
            },
            child: todayWorkouts.isEmpty
                ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  "На сегодня тренировок не запланировано",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )
                : Column(
              children: todayWorkouts.map((program) => Padding(
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
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekCalendar extends StatelessWidget {
  final Map<int, List<WorkoutProgram>> schedule;
  const _WeekCalendar({required this.schedule});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final date = startOfWeek.add(Duration(days: index));
        final weekday = index + 1;
        final isToday = date.day == now.day && date.month == now.month;

        final bool shouldUnderline = (schedule[weekday] ?? []).isNotEmpty;

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
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: Color(0xFFE2E2E2),
          shape: BoxShape.circle,
        ),
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
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Color(0xFF141414)),
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

class _GoalItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isDone;
  const _GoalItem({required this.title, required this.subtitle, required this.isDone});

  @override
  State<_GoalItem> createState() => _GoalItemState();
}

class _GoalItemState extends State<_GoalItem> {
  late bool _isDone;

  @override
  void initState() {
    super.initState();
    _isDone = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDone = !_isDone;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          SvgPicture.asset(
            _isDone ? 'assets/icons/on.svg' : 'assets/icons/off.svg',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, height: 1.2),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14, height: 1.2),
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
        Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
      ],
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final WorkoutProgram program;
  final VoidCallback? onTap;

  const _ProgramCard({required this.program, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}