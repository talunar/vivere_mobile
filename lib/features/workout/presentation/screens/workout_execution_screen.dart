import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/entities/workout_program.dart';

class WorkoutExecutionScreen extends StatefulWidget {
  final List<ExerciserInProgram> exercises;

  const WorkoutExecutionScreen({super.key, required this.exercises});

  @override
  State<WorkoutExecutionScreen> createState() => _WorkoutExecutionScreenState();
}

class _WorkoutExecutionScreenState extends State<WorkoutExecutionScreen> {
  int currentIndex = 0;
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isPaused = true;

  @override
  void initState() {
    super.initState();
    _initExercise();
  }

  void _initExercise() {
    _timer?.cancel();
    final exercise = widget.exercises[currentIndex];
    final repeat = exercise.repeats.first;
    
    if (repeat.seconds != null) {
      _remainingSeconds = repeat.seconds!;
      _isPaused = true;
      _startTimer();
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

  void _next() {
    if (currentIndex < widget.exercises.length - 1) {
      setState(() {
        currentIndex++;
        _initExercise();
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _prev() {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercises[currentIndex];
    final repeat = exercise.repeats.first;
    final isTimeBased = repeat.seconds != null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Image.network(
                  exercise.image,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: _CircleButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: '${currentIndex + 1} ', style: const TextStyle(color: Color(0xFFFF5900))),
                        TextSpan(text: '/ ${widget.exercises.length}'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  exercise.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.4),
                ),
              ],
            ),
          ),

          const Spacer(),

          if (isTimeBased)
            _TimerDisplay(
              seconds: _remainingSeconds,
              totalSeconds: repeat.seconds!,
              isPaused: _isPaused,
              onToggle: _togglePause,
            )
          else
            Text(
              'x ${repeat.reps}',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Color(0xFFFF5900)),
            ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 110),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: currentIndex > 0 ? _prev : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    child: Text(
                      currentIndex == widget.exercises.length - 1 ? 'Завершить' : 'Вперед',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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

class _TimerDisplay extends StatelessWidget {
  final int seconds;
  final int totalSeconds;
  final bool isPaused;
  final VoidCallback onToggle;

  const _TimerDisplay({
    required this.seconds,
    required this.totalSeconds,
    required this.isPaused,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final String minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 220,
          height: 220,
          child: CircularProgressIndicator(
            value: totalSeconds > 0 ? seconds / totalSeconds : 0,
            strokeWidth: 12,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF5900)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isPaused ? Icons.play_arrow : Icons.pause, size: 40, color: const Color(0xFFFF5900)),
              onPressed: onToggle,
            ),
            Text(
              '$minutesStr:$secondsStr',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFFFF5900)),
            ),
          ],
        ),
      ],
    );
  }
}
