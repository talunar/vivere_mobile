import '../models/workout_dto.dart';
import 'i_workout_data_source.dart';

class WorkoutMockDataSource implements IWorkoutDataSource {
  final String _exerciseImagePath = 'assets/images/exercises/workout_1.png';

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 700));

  @override
  Future<List<CategoryDto>> getCategories({int limit = 10, int offset = 0}) async {
    await _delay();
    final List<String> categoryNames = [
      'Силовые', 'Кардио', 'Разминка', 'Похудение', 'Йога',
      'Пилатес', 'Кроссфит', 'Растяжка', 'Бокс', 'Танцы'
    ];
    final all = List.generate(categoryNames.length, (index) => CategoryDto(
    id: index + 1,
    name: categoryNames[index],
    image: 'assets/images/exercises/workout_${(index % 9) + 1}.png',
    programs: _generatePrograms(index + 1),
    ));
    if (offset >= all.length) return [];
    return all.sublist(offset, (offset + limit).clamp(0, all.length));
  }

  List<ProgramDto> _generatePrograms(int catId) {
    return List.generate(5, (index) => ProgramDto(
      id: catId * 100 + index,
      name: 'Программа ${index + 1}',
      description: 'Эффективная тренировка для вашего прогресса.',
    ));
  }

  @override
  Future<CategoryDto> getCategory(int id) async {
    final all = await getCategories(limit: 100);
    return all.firstWhere((c) => c.id == id);
  }

  @override
  Future<ProgramDto> getWorkout(int id) async {
    await _delay();
    return ProgramDto(
      id: id,
      name: 'Программа #$id',
      description: 'Выполняйте упражнения последовательно, соблюдая технику.',
      workouts: [
        WorkoutDto(
          id: 1,
          name: 'Основной блок',
          description: 'Чередование нагрузки',
          exercises: List.generate(6, (i) => ExerciserDto(
            id: id * 1000 + i,
            name: 'Упражнение ${i + 1}',
            description: 'Следите за дыханием и выполняйте движения плавно.',
            image: _exerciseImagePath,
            repeats: [
              if (i % 2 == 0)
                RepeatedDto(id: i, weight: 0, seconds: 30, reps: 0)
              else
                RepeatedDto(id: i, weight: 0, reps: 20, seconds: 0),
            ],
          )),
        ),
      ],
    );
  }
}