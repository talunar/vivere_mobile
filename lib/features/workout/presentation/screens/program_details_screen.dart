import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/entities/workout_program.dart';
import '../providers/workout_providers.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'workout_execution_screen.dart';

class ProgramDetailsScreen extends ConsumerStatefulWidget {
  final WorkoutProgram program;

  const ProgramDetailsScreen({super.key, required this.program});

  @override
  ConsumerState<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends ConsumerState<ProgramDetailsScreen> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageHeight = screenWidth * (240 / 402);
    final authState = ref.watch(authControllerProvider);

    final userId = authState.maybeWhen(
      authenticated: (user) => user.id.value,
      orElse: () => null,
    );

    final userProgramsAsync = userId != null
        ? ref.watch(userProgramsProvider(userId))
        : const AsyncValue<List<WorkoutProgram>>.data([]);

    final bool isAlreadyAdded = userProgramsAsync.maybeWhen(
      data: (programs) => programs.any((p) => p.id == widget.program.id),
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: imageHeight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                    child: Image.asset(
                      "assets/images/programs/workout_1.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/icons/back.svg',
                          width: 54,
                          height: 54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => isBookmarked = !isBookmarked),
                        child: SvgPicture.asset(
                          isBookmarked
                              ? 'assets/icons/bookmark_filled.svg'
                              : 'assets/icons/bookmark.svg',
                          width: 54,
                          height: 54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.program.title,
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xFF141414), fontFamily: 'Golos Text'),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFFB800), size: 24),
                          const SizedBox(width: 4),
                          Text(
                            widget.program.rating?.toString() ?? '5.0',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF141414), fontFamily: 'Golos Text'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.program.description ?? '',
                    style: const TextStyle(color: Color(0xFF757575), fontSize: 15, height: 1.5, fontFamily: 'Golos Text'),
                  ),
                  const SizedBox(height: 24),
                  _InfoRow(label: 'Уровень:', value: widget.program.level ?? 'Продвинутый'),
                  _InfoRow(label: 'Инвентарь:', value: widget.program.equipment ?? 'Гантели, коврик'),
                  _InfoRow(label: 'Время:', value: '${widget.program.durationMinutes ?? 15} минут'),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage("assets/images/programs/workout_1.png"),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.program.trainerName ?? 'Vivere Pro Trainer',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF141414)),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFFFFB800), size: 14),
                              SizedBox(width: 4),
                              Text('4,9', style: TextStyle(fontSize: 12, color: Color(0xFF757575), fontFamily: 'Golos Text')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ...widget.program.exercises.map((exercise) => _ExerciseTile(exercise: exercise)).toList(),
                  const SizedBox(height: 32),
                  if (userId != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: OutlinedButton(
                        onPressed: () async {
                          final notifier = ref.read(userProgramsProvider(userId).notifier);
                          if (isAlreadyAdded) {
                            await notifier.deleteProgram(widget.program.id);
                          } else {
                            await notifier.addProgram(widget.program);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: isAlreadyAdded ? Colors.red : const Color(0xFFFF5900),
                          side: BorderSide(color: isAlreadyAdded ? Colors.red : const Color(0xFFFF5900)),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        ),
                        child: Text(isAlreadyAdded ? 'Удалить из планов' : 'Добавить в мои планы', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Golos Text')),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutExecutionScreen(exercises: widget.program.exercises))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5900),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      elevation: 0,
                    ),
                    child: const Text('Начать тренировку', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Golos Text')),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Color(0xFF141414), fontSize: 16, fontFamily: 'Golos Text'),
          children: [
            TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.w700)),
            TextSpan(text: value, style: const TextStyle(color: Color(0xFF757575))),
          ],
        ),
      ),
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  final ExerciserInProgram exercise;
  const _ExerciseTile({required this.exercise});
  @override
  Widget build(BuildContext context) {
    final repeat = exercise.repeats.first;
    final String subtitle = repeat.seconds != null ? '${repeat.seconds} секунд' : '${repeat.reps} повторений';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset("assets/images/exercises/workout_3.png", width: 64, height: 64, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF141414), fontFamily: 'Golos Text')),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Color(0xFFFF5900), fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Golos Text')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
