import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/workout_providers.dart';
import 'program_details_screen.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    initializeDateFormatting('ru_RU', null);
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headerHeight = statusBarHeight + 56;

    final authState = ref.watch(authControllerProvider);
    final userId = authState.maybeWhen(
      authenticated: (user) => user.id.value,
      orElse: () => null,
    );

    final programsAsync = userId != null
        ? ref.watch(userProgramsProvider(userId))
        : const AsyncValue.data([]);

    final String formattedDate = DateFormat('EEEE,\nd MMMM', 'ru_RU').format(_selectedDate);
    final String capitalizedDate = formattedDate[0].toUpperCase() + formattedDate.substring(1);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, headerHeight + 30, 16, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  programsAsync.maybeWhen(
                    data: (programs) => _buildCalendarGrid(hasWorkouts: programs.isNotEmpty),
                    orElse: () => _buildCalendarGrid(hasWorkouts: false),
                  ),

                  const SizedBox(height: 24),

                  _DashboardCard(
                    title: "Калории сегодня",
                    showArrow: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _CalorieItem(label: "Завтрак", value: "320 kkal"),
                            _CalorieItem(label: "Обед", value: "220 kkal"),
                            _CalorieItem(label: "Ужин", value: "220 kkal"),
                          ],
                      ),
                    ),
                  ),

                  programsAsync.when(
                    data: (programs) {
                      if (programs.isEmpty) return const SizedBox.shrink();
                      return Column(
                        children: [
                          const SizedBox(height: 16),
                          _DashboardCard(
                            title: "Тренировки сегодня",
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
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: _DashboardCard(
                        title: "Тренировки сегодня",
                        child: Center(child: CircularProgressIndicator(color: Color(0xFFFF5900))),
                      ),
                    ),
                    error: (err, _) => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
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
                        asset: 'assets/icons/back.svg',
                        onTap: () => Navigator.maybePop(context),
                      ),
                      Expanded(
                        child: Text(
                          capitalizedDate,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF141414),
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            height: 1.1,
                          ),
                        ),
                      ),
                      const _IconBtn(asset: 'assets/icons/settings.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid({required bool hasWorkouts}) {
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: days.map((d) => Expanded(
            child: Center(
              child: Text(d, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14)),
            ),
          )).toList(),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 1.1,
          ),
          itemCount: 31,
          itemBuilder: (context, index) {
            final day = index + 1;
            final date = DateTime(2025, 3, day);
            final isSelected = day == _selectedDate.day;
            final isToday = day == DateTime.now().day && DateTime.now().month == 3;

            // Логика подчеркивания: вторник (2) и четверг (4) при наличии программ
            final bool shouldUnderline = hasWorkouts && (date.weekday == DateTime.tuesday || date.weekday == DateTime.thursday);

            return GestureDetector(
              onTap: () => setState(() => _selectedDate = date),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFFF5900) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "$day",
                        style: TextStyle(
                          color: isSelected ? Colors.white : (isToday ? const Color(0xFFFF5900) : const Color(0xFF141414)),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 16,
                    height: 2,
                    color: shouldUnderline ? const Color(0xFFFF5900) : Colors.transparent,
                  ),
                ],
              ),
            );
          },
        ),
      ],
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
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 8),
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
                if (showArrow) const Icon(Icons.arrow_circle_right, size: 36, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 16),
          child,
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
  final dynamic program;
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
