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
  bool _isDescriptionExpanded = false;

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
    _isDescriptionExpanded = false;
    final exercise = _modifiedExercises[currentIndex];
    final repeat = exercise.repeats.isNotEmpty 
        ? exercise.repeats.first 
        : const Repeated(id: 0, weight: 0, reps: 10, seconds: 0);

    _weightController.text = repeat.weight.toString();
    if (repeat.seconds > 0) {
      _remainingSeconds = repeat.seconds;
      _valueController.text = _remainingSeconds.toString();
      _isPaused = true;
      _startTimer();
    } else {
      _valueController.text = repeat.reps.toString();
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
    final currentRepeat = currentExercise.repeats.isNotEmpty 
        ? currentExercise.repeats.first 
        : const Repeated(id: 0, weight: 0);

    final updatedRepeat = currentRepeat.copyWith(
      weight: weight,
      reps: currentRepeat.seconds == 0 ? value : currentRepeat.reps,
      seconds: currentRepeat.seconds > 0 ? value : 0,
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
        title: const Text("Завершить тренировку?", style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text("Все результаты будут сохранены в ваш профиль."),
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
      await ref.read(favoriteProgramsProvider(userId).notifier).saveAllProgress(_modifiedExercises);
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final exercise = _modifiedExercises[currentIndex];
    final repeat = exercise.repeats.isNotEmpty 
        ? exercise.repeats.first 
        : const Repeated(id: 0, weight: 0);
    final isTimeBased = repeat.seconds > 0;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: imageHeight,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                      child: Image.asset(
                        exercise.image,
                        width: double.infinity,
                        height: imageHeight,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: statusBarHeight + 80,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black45,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: statusBarHeight + 6,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: SvgPicture.asset(
                          'assets/icons/back.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // Индикатор упражнений
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF141414),
                            ),
                            children: [
                              TextSpan(
                                  text: "${currentIndex + 1}",
                                  style: const TextStyle(color: Color(0xFFFF5900))
                              ),
                              TextSpan(text: " / ${widget.exercises.length}"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Основной контент
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xFF141414)),
                      ),
                      const SizedBox(height: 8),
                      
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final textStyle = const TextStyle(fontSize: 15, color: Color(0xFF757575), height: 1.4);
                          final textPainter = TextPainter(
                            text: TextSpan(text: exercise.description, style: textStyle),
                            maxLines: 3,
                            textDirection: TextDirection.ltr,
                          )..layout(maxWidth: constraints.maxWidth);

                          final isLong = textPainter.didExceedMaxLines;

                          return GestureDetector(
                            onTap: isLong ? () => setState(() => _isDescriptionExpanded = true) : null,
                            child: Text(
                              exercise.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle,
                            ),
                          );
                        },
                      ),

                      Expanded(
                        child: Center(
                          child: isTimeBased
                              ? _TimerDisplay(
                                  seconds: _remainingSeconds,
                                  totalSeconds: repeat.seconds,
                                  isPaused: _isPaused,
                                  onToggle: _togglePause,
                                  currentIndex: currentIndex,
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'x ${repeat.reps}',
                                      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Color(0xFFFF5900)),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "Повторений",
                                      style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
                                    ),
                                  ],
                                ),
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
                            minimumSize: const Size(0, 50),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
        ),
        
        if (_isDescriptionExpanded)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() => _isDescriptionExpanded = false),
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                child: Center(
                  child: GestureDetector(
                    onTap: () => setState(() => _isDescriptionExpanded = false),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  exercise.name,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => setState(() => _isDescriptionExpanded = false),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Text(
                                exercise.description,
                                style: const TextStyle(fontSize: 16, color: Color(0xFF141414), height: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                  Text("Сохранение прогресса...", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
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
  final int currentIndex;

  const _TimerDisplay({
    required this.seconds,
    required this.totalSeconds,
    required this.isPaused,
    required this.onToggle,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final String minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    final double progress = totalSeconds > 0 ? (seconds / totalSeconds) : 0;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 220,
          height: 220,
          child: TweenAnimationBuilder<double>(
            key: ValueKey('timer_progress_$currentIndex'),
            duration: isPaused ? Duration.zero : const Duration(seconds: 1),
            curve: Curves.linear,
            tween: Tween<double>(end: progress),
            builder: (context, value, _) {
              return CircularProgressIndicator(
                value: value,
                strokeWidth: 12,
                backgroundColor: const Color(0xFFE2E2E2),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF5900)),
              );
            },
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 80, color: const Color(0xFFFF5900)),
              onPressed: onToggle,
            ),
            Text('$minutesStr:$secondsStr', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFFFF5900))),
          ],
        ),
      ],
    );
  }
}
