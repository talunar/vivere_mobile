import '../../domain/entities/repeated.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';

class MockWorkoutRepository implements IWorkoutRepository {

  @override
  Future<List<WorkoutCategory>> getCategories({int limit = 10, int offset = 0}) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final List<String> categoryNames = [
      'Силовые', 'Кардио', 'Разминка', 'Похудение', 'Йога',
      'Пилатес', 'Кроссфит', 'Бокс', 'HIIT', 'Пресс', 'Табата',
      'Медитация', 'Гибкость', 'Осанка', 'Спина', 'Ноги', 'Руки',
      'Грудь', 'Плечи', 'Табата'
    ];

    final allCategories = List.generate(categoryNames.length, (index) {
      final imageNumber = (index % 9) + 1;

      return WorkoutCategory(
        id: index + 1,
        name: categoryNames[index],
        image: 'assets/images/categories/workout_$imageNumber.png',
        isMainScreen: index < 15,
        programs: _generateProgramsList(index + 1, limit: 5, offset: 0)
      );
    });

    if (offset >= allCategories.length) return [];

    final end = (offset + limit) > allCategories.length
        ? allCategories.length
        : (offset + limit);

    return allCategories.sublist(offset, end);
  }

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    final categories = await getCategories(limit: 100, offset: 0);
    return categories.firstWhere((c) => c.id == id);
  }

  @override
  Future<List<WorkoutProgram>> getProgramsByCategory(
    int categoryId, {
    int limit = 10,
    int offset = 0,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    return _generateProgramsList(categoryId, limit: limit, offset: offset, total: 30);
  }

  @override
  Future<WorkoutProgram> getProgramDetails(int programId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _generateSingleProgram(programId);
  }

  List<WorkoutProgram> _generateProgramsList(int catId, {required int limit, required int offset, int total = 6}) {
    if (offset >= total) return [];

    final end = (offset + limit) > total ? total : (offset + limit);
    final count = end - offset;

    return List.generate(count, (index) => _generateSingleProgram(offset + index + catId * 100));
  }

  WorkoutProgram _generateSingleProgram(int id) {
    return WorkoutProgram(
      id: id,
      title: 'Программа тренировки #$id',
      rating: 4.8,
      trainerName: 'Vivere Pro Trainer',
      trainerImage: 'assets/images/avatar/trainer_5.png',
      image: 'assets/images/programs/workout_1.png',
      description: 'Эффективная программа для достижения ваших целей в кратчайшие сроки.',
      level: 'Продвинутый',
      equipment: 'Гантели, коврик',
      durationMinutes: 40,
      exercises: List.generate(8, (i) {
        final imageNumber = (i % 4) + 1;
        return ExerciserInProgram(
          id: i + (id * 100),
          name: 'Упражнение ${i + 1}',
          description: 'Выполняйте упражнение плавно, следя за техникой и дыханием. Не забывайте делать глоток воды между подходами, но не более. Дышите через нос и выдыхайте через рот. Эта часть для очень длинного текста для тестирования всплывающего окна при нажатие. Хорошей вам тренировки!',
          image: 'assets/images/exercises/workout_$imageNumber.png',
          repeats: [
            if (i % 2 == 0)
              Repeated(id: 1 + i, weight: 0, reps: 0, seconds: 60 + (i * 5))
            else
              Repeated(id: 1 + i, weight: 10 + i, reps: 30 + i, seconds: 0),
          ],
        );
      }),
    );
  }
}

