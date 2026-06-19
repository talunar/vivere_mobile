import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vivere_mobile/core/presentation/widgets/dashboard_card.dart';
import 'package:vivere_mobile/core/presentation/widgets/app_circle_button.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/workout_program.dart';
import '../providers/workout_providers.dart';
import '../providers/navigation_provider.dart';
import 'program_details_screen.dart';
import 'my_workouts_screen.dart';

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

  void _showEditScheduleSheet(BuildContext context, List<WorkoutProgram> favorites) {
    final currentSchedule = ref.read(workoutScheduleProvider);
    final Map<int, List<WorkoutProgram>> tempSchedule = currentSchedule.map(
          (key, value) => MapEntry(key, List<WorkoutProgram>.from(value)),
    );

    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 352),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "График тренировок",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Назначьте тренировки из избранного на дни недели.",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(7, (index) {
                          final weekday = index + 1;
                          final dayNamesShort = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
                          final dayNameShort = dayNamesShort[index];
                          final programs = tempSchedule[weekday] ?? [];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyWorkoutsScreen(
                                      onSelect: (selectedProgram) {
                                        if (!tempSchedule[weekday]!.any((p) => p.id == selectedProgram.id)) {
                                          tempSchedule[weekday]!.add(selectedProgram);
                                        }
                                        setModalState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE2E2E2),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: programs.isNotEmpty ? const Color(0xFFFF5900) : Colors.transparent,
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 32,
                                      child: Text(
                                        dayNameShort,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color(0xFF141414)
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        programs.isEmpty
                                            ? "Нажмите, чтобы добавить"
                                            : "Тренировок: ${programs.length}",
                                        style: TextStyle(
                                          color: programs.isNotEmpty ? Colors.black : const Color(0xFF9E9E9E),
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (programs.isNotEmpty)
                                      GestureDetector(
                                        onTap: () {
                                          tempSchedule[weekday] = [];
                                          setModalState(() {});
                                        },
                                        child: const Icon(Icons.delete_sweep_outlined, color: Colors.grey, size: 20),
                                      )
                                    else
                                      const Icon(Icons.add_circle_outline, color: Color(0xFFFF5900), size: 20),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Отмена", style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(workoutScheduleProvider.notifier).state = Map<int, List<WorkoutProgram>>.from(tempSchedule);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "ОК",
                          style: TextStyle(color: Color(0xFFFF5900), fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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

    final favoritesAsync = userId != null
        ? ref.watch(favoriteProgramsProvider(userId))
        : const AsyncValue.data(<WorkoutProgram>[]);

    final favorites = favoritesAsync.value ?? [];
    final schedule = ref.watch(workoutScheduleProvider);

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
                  _buildCalendarGrid(schedule),
                  const SizedBox(height: 24),
                  DashboardCard(
                    title: "Калории сегодня",
                    showArrow: true,
                    bottomPadding: 24,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CalorieItem(label: "Завтрак", value: "320 kkal"),
                        _CalorieItem(label: "Обед", value: "220 kkal"),
                        _CalorieItem(label: "Ужин", value: "220 kkal"),
                      ],
                    ),
                  ),
                  _buildDailyWorkouts(favorites, schedule),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0, left: 0, right: 0, height: headerHeight + 40,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFFF6F6F6), const Color(0xFFF6F6F6), const Color(0xFFF6F6F6).withOpacity(0.0)],
                  stops: const [0.0, 0.8, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0, left: 0, right: 0,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 56,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      AppCircleButton(
                        assetPath: 'assets/icons/back.svg',
                        onTap: () => ref.read(navigationNotifierProvider.notifier).goBack(),
                      ),
                      Expanded(
                        child: Text(
                          capitalizedDate,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xFF141414), fontWeight: FontWeight.w400, fontSize: 22, height: 1.1),
                        ),
                      ),
                      AppCircleButton(
                        assetPath: 'assets/icons/settings.svg',
                        onTap: () => _showEditScheduleSheet(context, favorites),
                      ),
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

  Widget _buildDailyWorkouts(List<WorkoutProgram> favorites, Map<int, List<WorkoutProgram>> schedule) {
    final int weekday = _selectedDate.weekday;
    final List<WorkoutProgram> todayPrograms = schedule[weekday] ?? [];

    return Column(
      children: [
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
                      final dayPrograms = List<WorkoutProgram>.from(newState[weekday] ?? []);

                      if (!dayPrograms.any((p) => p.id == selectedProgram.id)) {
                        dayPrograms.add(selectedProgram);
                        newState[weekday] = dayPrograms;
                      }
                      return newState;
                    });
                  },
                ),
              ),
            );
          },
          child: todayPrograms.isEmpty
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
            children: todayPrograms.map((program) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
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
    );
  }

  Widget _buildCalendarGrid(Map<int, List<WorkoutProgram>> schedule) {
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    final firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final int offset = firstDayOfMonth.weekday - 1;
    final int daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;

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
          itemCount: daysInMonth + offset,
          itemBuilder: (context, index) {
            if (index < offset) return const SizedBox.shrink();

            final day = index - offset + 1;
            final date = DateTime(_selectedDate.year, _selectedDate.month, day);
            final isSelected = day == _selectedDate.day;
            final isToday = day == DateTime.now().day &&
                _selectedDate.month == DateTime.now().month &&
                _selectedDate.year == DateTime.now().year;

            final bool hasWorkout = (schedule[date.weekday] ?? []).isNotEmpty;

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
                          fontWeight: isToday ? FontWeight.bold : FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 16,
                    height: 2,
                    color: hasWorkout ? const Color(0xFFFF5900) : Colors.transparent,
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

  Widget _smartImage(String path, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    if (path.startsWith('http')) {
      return Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => Image.asset(
          'assets/images/programs/workout_1.png',
          width: width,
          height: height,
          fit: fit,
        ),
      );
    }
    return Image.asset(
      path, 
      width: width, 
      height: height, 
      fit: fit,
      errorBuilder: (_, __, ___) => Image.asset(
        'assets/images/programs/workout_1.png',
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  ImageProvider _smartImageProvider(String path) {
    if (path.isEmpty || path.contains('trainer_1.png')) {
      return const AssetImage('assets/images/avatar/trainer_1.png');
    }
    if (path.startsWith('http')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }

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
              child: _smartImage(program.displayImage, width: 160, height: 160),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF141414)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFB800), size: 16),
                        const SizedBox(width: 5),
                        Text(
                          program.rating?.toString() ?? "5.0",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF141414)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: const Color(0xFFE2E2E2),
                          backgroundImage: const AssetImage("assets/images/avatar/workout_1.png"),
                          foregroundImage: _smartImageProvider(program.displayTrainerImage),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            program.trainerName ?? "Coach",
                            style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
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
