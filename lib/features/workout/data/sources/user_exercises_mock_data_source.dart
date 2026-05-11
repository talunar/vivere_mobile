import '../models/workout_dto.dart';

class UserExercisesMockDataSource {
  static final List<ExerciserDto> _userExercises = [
    ExerciserDto(
      id: 901,
      name: 'Утренняя разминка',
      description: 'Ваша ежедневная активность для пробуждения организма.',
      image: 'assets/images/exercises/workout_1.png',
      repeats: [
        RepeatedDto(id: 1, weight: 0, reps: 15),
        RepeatedDto(id: 2, weight: 0, reps: 15),
      ],
    ),
    ExerciserDto(
      id: 902,
      name: 'Растяжка',
      description: 'Улучшение гибкости после рабочего дня.',
      image: 'assets/images/exercises/workout_2.png',
      repeats: [
        RepeatedDto(id: 3, weight: 0, reps: 20),
      ],
    ),
  ];

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 500));

  Future<List<ExerciserDto>> getUserExercises(int userId) async {
    await _delay();
    return List.from(_userExercises);
  }

  Future<void> addExerciseForUser(int userId, ExerciserDto exercise) async {
    await _delay();
    if (!_userExercises.any((e) => e.id == exercise.id)) {
      _userExercises.add(exercise);
    }
  }

  Future<void> deleteExercise(int exerciseId) async {
    await _delay();
    _userExercises.removeWhere((e) => e.id == exerciseId);
  }

  Future<void> updateExercise(ExerciserDto exercise) async {
    await _delay();
    final index = _userExercises.indexWhere((e) => e.id == exercise.id);
    if (index != -1) {
      _userExercises[index] = exercise;
    }
  }
}
