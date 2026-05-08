import 'package:flutter/material.dart';
import '../../domain/entities/workout_program.dart';
import 'workout_execution_screen.dart';

/// Экран деталей программы тренировок.
/// Содержит описание, информацию о тренере и список упражнений.
class ProgramDetailsScreen extends StatefulWidget {
  final WorkoutProgram program;

  const ProgramDetailsScreen({super.key, required this.program});

  @override
  State<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  // Состояние: добавлена ли программа в избранное
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана для адаптивного расчета высоты изображения
    final double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6), // Светло-серый фон как в дизайне
      body: Stack(
        children: [
          // Основное содержимое экрана, которое можно скроллить
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. ВЕРХНЕЕ ИЗОБРАЖЕНИЕ
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                  child: Image.asset(
                    "assets/design/workout_1.png", // Используем локальный ассет
                    width: double.infinity,
                    height: screenWidth * (240 / 402), 
                    fit: BoxFit.cover,
                  ),
                ),

                // Контент под изображением
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 2. ЗАГОЛОВОК И РЕЙТИНГ
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
                                widget.program.rating.toString(), 
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 3. ОПИСАНИЕ
                      Text(
                        widget.program.description ?? '',
                        style: const TextStyle(
                          color: Color(0xFF757575), 
                          fontSize: 15, 
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 4. ПАРАМЕТРЫ ПРОГРАММЫ (Уровень, Инвентарь, Время)
                      _InfoRow(label: 'Уровень:', value: widget.program.level ?? 'Продвинутый'),
                      _InfoRow(label: 'Инвентарь:', value: widget.program.equipment ?? 'Гантели, коврик'),
                      _InfoRow(label: 'Время:', value: '${widget.program.durationMinutes} минут'),

                      const SizedBox(height: 24),

                      // 5. КАРТОЧКА ТРЕНЕРА
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage("assets/design/workout_1.png"), 
                            backgroundColor: Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Super train 3000', 
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Color(0xFFFFB800), size: 14),
                                  SizedBox(width: 4),
                                  Text('4,1', style: TextStyle(fontSize: 12, color: Color(0xFF757575))),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // 6. СПИСОК УПРАЖНЕНИЙ
                      ...widget.program.exercises.map((exercise) => _ExerciseTile(exercise: exercise)).toList(),

                      const SizedBox(height: 30),

                      // 7. КНОПКА "НАЧАТЬ ТРЕНИРОВКУ"
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
                          minimumSize: const Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
          
          // 8. ВЕРХНИЕ КНОПКИ УПРАВЛЕНИЯ
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
  final dynamic exercise;
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
              "assets/design/workout_1.png", 
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
