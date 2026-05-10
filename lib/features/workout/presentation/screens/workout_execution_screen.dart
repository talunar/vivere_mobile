import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/entities/repeated.dart';
import '../providers/workout_providers.dart';

class WorkoutExecutionScreen extends ConsumerStatefulWidget {
  final List<ExerciserInProgram> exercises;

  const WorkoutExecutionScreen({super.key, required this.exercises});

  @override
  ConsumerState<WorkoutExecutionScreen> createState() => _WorkoutExecutionScreenState();
}

class _WorkoutExecutionScreenState extends ConsumerState<WorkoutExecutionScreen> {
  int currentIndex = 0;
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isPaused = true;

  // Локальные контроллеры для редактирования текущего подхода
  late TextEditingController _weightController;
  late TextEditingController _valueController; // для повторов или секунд

  // Храним копию упражнений с изменениями пользователя
  late List<ExerciserInProgram> _modifiedExercises;

  @override
  void initState() {
    super.initState();
    _modifiedExercises = List.from(widget.exercises);
    _weightController = TextEditingController();
    _valueController = TextEditingController();
    _initExercise();
  }

  void _initExercise() {
    _timer?.cancel();
    final exercise = _modifiedExercises[currentIndex];
    final repeat = exercise.repeats.first;

    _weightController.text = repeat.weight.toString();
    if (repeat.seconds != null) {
      _remainingSeconds = repeat.seconds!;
      _valueController.text = _remainingSeconds.toString();
      _isPaused = true;
      _startTimer();
    } else {
      _valueController.text = repeat.reps?.toString() ?? '0';
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
          } else {
            _timer?.cancel();
          }
        });
      }
    });
  }

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  // Сохраняем текущие введенные значения в локальный список
  void _saveCurrentInput() {
    final weight = int.tryParse(_weightController.text) ?? 0;
    final value = int.tryParse(_valueController.text) ?? 0;

    final currentExercise = _modifiedExercises[currentIndex];
    final currentRepeat = currentExercise.repeats.first;

    final updatedRepeat = currentRepeat.copyWith(
      weight: weight,
      reps: currentRepeat.seconds == null ? value : null,
      seconds: currentRepeat.seconds != null ? value : null,
    );

    _modifiedExercises[currentIndex] = currentExercise.copyWith(
      repeats: [updatedRepeat],
    );
  }

  Future<void> _finishWorkout() async {
    _saveCurrentInput();
    
    // Получаем userId из AuthController
    final authState = ref.read(authControllerProvider);
    final userId = authState.maybeWhen(
      authenticated: (user) => user.id.value,
      orElse: () => null,
    );

    if (userId != null) {
      // Отправляем прогресс по каждому измененному упражнению на бэк (Go: UpdateExercise)
      for (var exercise in _modifiedExercises) {
        await ref.read(userProgramsProvider(userId).notifier).saveProgress(exercise);
      }
    }

    if (mounted) Navigator.pop(context);
  }

  void _next() {
    _saveCurrentInput();
    if (currentIndex < _modifiedExercises.length - 1) {
      setState(() {
        currentIndex++;
        _initExercise();
      });
    } else {
      _finishWorkout();
    }
  }

  void _prev() {
    _saveCurrentInput();
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _initExercise();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _weightController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = _modifiedExercises[currentIndex];
    final repeat = exercise.repeats.first;
    final isTimeBased = repeat.seconds != null;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Image.network(
                  exercise.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, _, __) => Container(
                    height: 300,
                    color: Colors.grey[200],
                    child: const Icon(Icons.fitness_center, size: 64, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: _HeaderButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exercise.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 32),
                  
                  // Блок ввода данных (Прогресс)
                  Row(
                    children: [
                      Expanded(
                        child: _InputBox(
                          label: 'Вес (кг)',
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _InputBox(
                          label: isTimeBased ? 'Секунды' : 'Повторы',
                          controller: _valueController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  if (isTimeBased)
                    Center(
                      child: _TimerDisplay(
                        seconds: _remainingSeconds,
                        totalSeconds: int.tryParse(_valueController.text) ?? repeat.seconds!,
                        isPaused: _isPaused,
                        onToggle: _togglePause,
                      ),
                    )
                  else
                    Center(
                      child: Text(
                        'x ${_valueController.text}',
                        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Color(0xFFFF5900)),
                      ),
                    ),
                ],
              ),
            ),
          ),

          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: currentIndex > 0 ? _prev : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black87,
                        minimumSize: const Size(0, 60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('Назад', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5900),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        currentIndex == _modifiedExercises.length - 1 ? 'Завершить' : 'Вперед',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _HeaderButton({required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, color: Colors.black), onPressed: onPressed),
    );
  }
}

class _InputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const _InputBox({required this.label, required this.controller, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}

class _TimerDisplay extends StatelessWidget {
  final int seconds;
  final int totalSeconds;
  final bool isPaused;
  final VoidCallback onToggle;

  const _TimerDisplay({required this.seconds, required this.totalSeconds, required this.isPaused, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final String minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: totalSeconds > 0 ? seconds / totalSeconds : 0,
            strokeWidth: 10,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF5900)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isPaused ? Icons.play_arrow : Icons.pause, size: 48, color: const Color(0xFFFF5900)),
              onPressed: onToggle,
            ),
            Text('$minutesStr:$secondsStr', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFFFF5900))),
          ],
        ),
      ],
    );
  }
}
