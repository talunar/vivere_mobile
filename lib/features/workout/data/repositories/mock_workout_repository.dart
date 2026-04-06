import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';

class MockWorkoutRepository implements IWorkoutRepository {
  @override
  Future<List<WorkoutProgram>> getTopPrograms() async {
    // предложили имитировать реальную задержку сети в 1 сек
    // чтобы увидеть индикатор загрузки (CircularProgressIndicator)
    await Future.delayed(const Duration(seconds: 1));

    // 2. Возвращаем список тестовых данных
    return [
      const WorkoutProgram(
        id: '1',
        title: 'Силовая база: Ноги',
        rating: 4.9,
        trainerName: 'Крош',
        imageUrl: 'assets/design/workout_1.png',
        exercises: [
          Exercise(
            id: 'e1',
            title: 'Приседания со штангой',
            description: 'Держи спину ровно, опускайся до параллели с полом',
            defaultReps: 12,
            defaultWeight: 40.0,
          ),
          Exercise(
            id: 'e2',
            title: 'Выпады',
            description: 'Шаг вперед, колено не выходит за носок',
            defaultReps: 15,
            defaultWeight: 10.0,
          ),
        ],
      ),
      const WorkoutProgram(
        id: '2',
        title: 'Кардио Шторм',
        rating: 4.7,
        trainerName: 'Совунья',
        imageUrl: 'assets/design/workout_2.png',
        exercises: [
          Exercise(
            id: 'e3',
            title: 'Бёрпи',
            description: 'Максимально интенсивно!',
            defaultReps: 20,
            defaultWeight: 0.0,
          ),
        ],
      ),
      const WorkoutProgram(
        id: '3',
        title: 'Йога для спины',
        rating: 5.0,
        trainerName: 'Ёжик',
        imageUrl: 'assets/design/workout_1.png',
        exercises: [
          Exercise(
            id: 'e3',
            title: 'Наклоны',
            description: 'Легко и чилово',
            defaultReps: 20,
            defaultWeight: 0.0,
          ),
        ],
      ),
    ];
  }
}