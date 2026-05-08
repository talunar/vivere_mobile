import '../models/workout_dto.dart';

class WorkoutMockDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 700));

  // Имитация /exercises
  Future<List<CategoryDto>> getAllCategories() async {
    await _delay();
    return [
      const CategoryDto(
        id: 1,
        name: 'Силовые',
        image: 'assets/design/workout_1.png',
        programs: [
          ProgramDto(id: 101, name: 'Мощный старт', description: 'Базовая силовая программа'),
          ProgramDto(id: 102, name: 'Жим лежа+', description: 'Фокус на грудные мышцы'),
        ],
      ),
      const CategoryDto(
        id: 2,
        name: 'Кардио',
        image: 'assets/design/workout_1.png',
        programs: [
          ProgramDto(id: 201, name: 'Бег в гору', description: 'Выносливость и жиросжигание'),
        ],
      ),
    ];
  }

  // Имитация /workout?id=:id
  Future<ProgramDto> getWorkoutDetails(int id) async {
    await _delay();
    return ProgramDto(
      id: id,
      name: 'Программа #$id',
      description: 'Детальное описание программы тренировок с упражнениями.',
      exercises: [
        const ExerciserDto(
          id: 501,
          name: 'Приседания',
          description: 'Классические приседания со штангой',
          image: 'assets/design/workout_1.png',
          repeats: [RepeatedDto(id: 1, weight: 60), RepeatedDto(id: 2, weight: 60)],
        ),
        const ExerciserDto(
          id: 502,
          name: 'Отжимания',
          description: 'Широким хватом',
          image: 'assets/design/workout_1.png',
          repeats: [RepeatedDto(id: 3, weight: 0)],
        ),
      ],
    );
  }
}
