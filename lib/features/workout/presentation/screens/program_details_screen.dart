import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                  child: Image.asset(
                    "assets/images/programs/workout_1.png",
                    width: double.infinity,
                    height: screenWidth * (240 / 402),
                    fit: BoxFit.cover,
                  ),
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
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF212121),
                                fontFamily: 'Golos Text',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFFFB800), size: 24),
                              const SizedBox(width: 4),
                              Text(
                                widget.program.rating?.toString() ?? '5.0',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.program.description ?? '',
                        style: const TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 15,
                          height: 1.5,
                          fontFamily: 'Golos Text',
                        ),
                      ),
                      const SizedBox(height: 24),
                      _InfoRow(label: 'Уровень:', value: widget.program.level ?? 'Продвинутый'),
                      _InfoRow(label: 'Инвентарь:', value: widget.program.equipment ?? 'Гантели, коврик'),
                      _InfoRow(label: 'Время:', value: '${widget.program.durationMinutes ?? 15} минут'),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage("assets/images/programs/workout_2.png"),
                            backgroundColor: Colors.grey[300],
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.program.trainerName ?? 'Vivere Pro Trainer',
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Golos Text'),
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
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Программа удалена из ваших планов')),
                                  );
                                }
                              } else {
                                await notifier.addProgram(widget.program);
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Программа добавлена в ваши планы')),
                                  );
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: isAlreadyAdded ? Colors.red : const Color(0xFFFF5900),
                              side: BorderSide(color: isAlreadyAdded ? Colors.red : const Color(0xFFFF5900)),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Text(
                              isAlreadyAdded ? 'Удалить из планов' : 'Добавить в мои планы',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Golos Text'),
                            ),
                          ),
                        ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutExecutionScreen(exercises: widget.program.exercises),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5900),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Начать тренировку',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Golos Text',
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            child: _CircleButton(
              painter: BackIconPainter(color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 16,
            child: _CircleButton(
              painter: BookmarkIconPainter(
                color: isBookmarked ? Colors.white : Colors.black,
                isFilled: isBookmarked,
              ),
              isActive: isBookmarked,
              onPressed: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final CustomPainter painter;
  final VoidCallback onPressed;
  final bool isActive;

  const _CircleButton({
    required this.painter,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF212121) : Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(12),
        child: CustomPaint(
          painter: painter,
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
          style: const TextStyle(color: Color(0xFF212121), fontSize: 16, fontFamily: 'Golos Text'),
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
    final String subtitle = repeat.seconds != null
        ? '${repeat.seconds} секунд'
        : '${repeat.reps} повторений';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/programs/workout_3.png",
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF212121),
                    fontFamily: 'Golos Text',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFFF5900),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Golos Text',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackIconPainter extends CustomPainter {
  final Color color;
  BackIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.65, size.height * 0.25)
      ..lineTo(size.width * 0.35, size.height * 0.5)
      ..lineTo(size.width * 0.65, size.height * 0.75);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BookmarkIconPainter extends CustomPainter {
  final Color color;
  final bool isFilled;
  BookmarkIconPainter({required this.color, this.isFilled = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.25, size.height * 0.15)
      ..lineTo(size.width * 0.75, size.height * 0.15)
      ..lineTo(size.width * 0.75, size.height * 0.85)
      ..lineTo(size.width * 0.5, size.height * 0.65)
      ..lineTo(size.width * 0.25, size.height * 0.85)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
