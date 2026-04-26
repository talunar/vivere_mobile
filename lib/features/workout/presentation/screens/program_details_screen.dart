import 'package:flutter/material.dart';
import '../../domain/entities/workout_program.dart';
import 'workout_execution_screen.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final WorkoutProgram program;

  const ProgramDetailsScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFFF5F5F5), // Фон под кнопкой
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100, top: 12),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkoutExecutionScreen(exercises: program.exercises),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF5900),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Начать тренировку',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Golos Text',
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Основной контент (скроллится)
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Изображение сверху
                Stack(
                  children: [
                    Image.network(
                      program.image ?? '',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      right: 16,
                      child: _CircleButton(
                        icon: Icons.bookmark_border,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 2. Название и рейтинг
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              program.title,
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 24),
                              Text(' ${program.rating}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 3. Описание
                      Text(
                        program.description ?? '',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.5),
                      ),
                      const SizedBox(height: 24),

                      // 4. Параметры (Уровень, Инвентарь, Время)
                      _InfoRow(label: 'Уровень:', value: program.level ?? 'Средний'),
                      _InfoRow(label: 'Инвентарь:', value: program.equipment ?? 'Нет'),
                      _InfoRow(label: 'Время:', value: '${program.durationMinutes} минут'),

                      const SizedBox(height: 24),

                      // 5. Тренер
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(program.trainerImage ?? ''),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(program.trainerName ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 16),
                                  Text(' 4,1', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // 6. Список упражнений
                      const Text('Упражнения', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      ...program.exercises.map((exercise) => _ExerciseTile(exercise: exercise)).toList(),

                      const SizedBox(height: 100), // Отступ для кнопки внизу
                    ],
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

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _CircleButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, color: Colors.black), onPressed: onPressed),
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
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  final dynamic exercise; // ExerciserInProgram
  const _ExerciseTile({required this.exercise});

  @override
  Widget build(BuildContext context) {
    final repeat = exercise.repeats.first;
    final String subtitle = repeat.seconds != null 
        ? '${repeat.seconds} секунд' 
        : '${repeat.reps} приседаний'; // Мокаем для примера

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(exercise.image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xFFFF5900)), // Твой цвет #FF5900
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
