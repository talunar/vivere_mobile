import '../models/workout_dto.dart';
import 'i_user_exercises_data_source.dart';

class UserExercisesMockDataSource implements IUserExercisesDataSource {
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

  @override
  Future<List<ExerciserDto>> getUserExercises(int userId) async {
    await _delay();
    return List.from(_userExercises);
  }

  @override
  Future<ProgramDto?> getCurrentExercise(int userId) async {
    await _delay();
    return null;
  }

  @override
  Future<void> addExerciseForUser(int userId, ExerciserDto exercise) async {
    await _delay();
    if (!_userExercises.any((e) => e.id == exercise.id)) {
      _userExercises.add(exercise);
    }
  }

  @override
  Future<void> deleteExercise(int exerciseId) async {
    await _delay();
    _userExercises.removeWhere((e) => e.id == exerciseId);
  }

  @override
  Future<void> updateExercise(int exerciseId, ExerciserDto exercise) async {
    await _delay();
    final index = _userExercises.indexWhere((e) => e.id == exerciseId);
    if (index != -1) {
      _userExercises[index] = exercise;
    }
  }
}
