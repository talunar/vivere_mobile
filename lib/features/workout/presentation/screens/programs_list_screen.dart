import 'package:flutter/material.dart';
import '../../domain/entities/workout_program.dart';
import 'program_details_screen.dart';

class ProgramsListScreen extends StatelessWidget {
  final String categoryName;
  final List<WorkoutProgram> programs;

  const ProgramsListScreen({
    super.key,
    required this.categoryName,
    required this.programs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SizedBox(
            width: 24,
            height: 24,
            child: CustomPaint(
              painter: BackIconPainter(color: Colors.black),
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Golos Text',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          color: Color(0xFFE2E2E2),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView.separated(
          // Добавляем отступ снизу (100), чтобы нижнее меню не перекрывало контент
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          itemCount: programs.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final program = programs[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProgramCard(
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
          },
        ),
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final WorkoutProgram? program;
  final VoidCallback? onTap; // Добавляем колбэк для нажатия

  const ProgramCard({
    super.key,
    this.program,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Теперь при нажатии будет срабатывать переход
      child: Container(
        width: 352,
        height: 160,
        // Убираем margin отсюда, чтобы управлять расстоянием в ListView или Column
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
                padding: const EdgeInsets.only(left: 15, top: 20, right: 12, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program?.title ?? "Программа тренировки",
                      style: const TextStyle(
                        fontSize: 15,
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
                          program?.rating?.toString() ?? "4,8",
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
                            program?.trainerName ?? "Super train 3000",
                            style: TextStyle(
                              fontSize: 13,
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

/// Кастомная иконка "Назад" (шеврон)
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
