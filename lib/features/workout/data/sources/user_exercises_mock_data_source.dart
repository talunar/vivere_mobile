import '../models/workout_dto.dart';

class UserExercisesMockDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 500));

  // Имитация /get-user-exercise/:id
  Future<List<ExerciserDto>> getUserExercises(int userId) async {
    await _delay();
    return [
      const ExerciserDto(
        id: 901,
        name: 'Утренняя разминка',
        description: 'Ваша ежедневная активность для пробуждения организма.',
        image: 'assets/design/workout_1.png',
        repeats: [
          RepeatedDto(id: 1, weight: 0),
          RepeatedDto(id: 2, weight: 0),
        ],
      ),
      const ExerciserDto(
        id: 902,
        name: 'Растяжка',
        description: 'Улучшение гибкости после рабочего дня.',
        image: 'assets/design/workout_1.png',
        repeats: [
          RepeatedDto(id: 3, weight: 0),
        ],
      ),
    ];
  }

  Future<void> addExerciseForUser(int userId, ExerciserDto exercise) async {
    await _delay();
    // POST запрос
  }

  Future<ExerciserDto> updateExercise(int exerciseId, ExerciserDto update) async {
    await _delay();
    return update;
  }

  Future<void> deleteExercise(int exerciseId) async {
    await _delay();
  }
}
