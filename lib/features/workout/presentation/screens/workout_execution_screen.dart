import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool _isSaving = false;

  late TextEditingController _weightController;
  late TextEditingController _valueController;

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
    setState(() => _isPaused = !_isPaused);
  }

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
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text("Завершить тренировку?", style: TextStyle(fontFamily: 'Golos Text')),
        content: const Text("Все результаты будут сохранены в ваш профиль.", style: TextStyle(fontFamily: 'Golos Text')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Еще нет", style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Завершить", style: TextStyle(color: Color(0xFFFF5900), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isSaving = true);
    _saveCurrentInput();
    
    final authState = ref.read(authControllerProvider);
    final userId = authState.maybeWhen(
      authenticated: (user) => user.id.value,
      orElse: () => null,
    );

    if (userId != null) {
      await ref.read(userProgramsProvider(userId).notifier).saveAllProgress(_modifiedExercises);
    }

    if (mounted) {
      setState(() => _isSaving = false);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Тренировка завершена! Прогресс сохранен.'), backgroundColor: Color(0xFFFF5900)),
      );
    }
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageHeight = screenWidth * (240 / 402);
    final exercise = _modifiedExercises[currentIndex];
    final repeat = exercise.repeats.first;
    final isTimeBased = repeat.seconds != null;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: 80,
            leadingWidth: 70,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: _CircleHeaderButton(
                  asset: 'assets/icons/back.svg',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              // Верхний блок с изображением
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: imageHeight,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                      child: Image.asset(
                        "assets/images/exercises/workout_3.png",
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Индикатор упражнений (1 / 5)
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.w900, 
                            color: Color(0xFF141414), 
                            fontFamily: 'Golos Text'
                          ),
                          children: [
                            TextSpan(text: "${currentIndex + 1}", style: const TextStyle(color: Color(0xFFFF5900))),
                            TextSpan(text: " / ${widget.exercises.length}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Основной контент
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xFF141414)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        exercise.description,
                        style: const TextStyle(fontSize: 15, color: Color(0xFF757575), height: 1.4),
                      ),
                      const SizedBox(height: 32),
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
                          child: Column(
                            children: [
                              Text(
                                'x ${_valueController.text}',
                                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Color(0xFFFF5900), fontFamily: 'Golos Text'),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Повторений",
                                style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16, fontFamily: 'Golos Text'),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Кнопки управления
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
                            backgroundColor: const Color(0xFFE2E2E2),
                            foregroundColor: const Color(0xFF141414),
                            minimumSize: const Size(0, 50),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                          child: const Text('Назад', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Golos Text')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _next,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5900),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(0, 50),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                          child: Text(
                            currentIndex == _modifiedExercises.length - 1 ? 'Завершить' : 'Вперед',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Golos Text'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_isSaving)
          Container(
            color: Colors.black54,
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: Color(0xFFFF5900)),
                  SizedBox(height: 16),
                  Text("Сохранение прогресса...", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Golos Text')),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _CircleHeaderButton extends StatelessWidget {
  final String asset;
  final VoidCallback onPressed;
  const _CircleHeaderButton({required this.asset, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(asset, colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn)),
      ),
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
            backgroundColor: const Color(0xFFE2E2E2),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF5900)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 64, color: const Color(0xFFFF5900)),
              onPressed: onToggle,
            ),
            Text('$minutesStr:$secondsStr', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFFFF5900), fontFamily: 'Golos Text')),
          ],
        ),
      ],
    );
  }
}
