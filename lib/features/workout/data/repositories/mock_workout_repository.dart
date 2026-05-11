import '../../domain/entities/repeated.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';

class MockWorkoutRepository implements IWorkoutRepository {
  // Новые пути к ассетам
  final String _programImagePath = 'assets/images/programs/workout_1.png';
  final String _exerciseImagePath = 'assets/images/exercises/workout_1.png';
  final String _categoryImagePath = 'assets/images/categories/workout_1.png'; // Предположим, там тоже есть файлы
  final String _trainerImagePath = 'assets/images/programs/workout_2.png';

  @override
  Future<List<WorkoutCategory>> getCategories({int limit = 10, int offset = 0}) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final List<String> categoryNames = [
      'Силовые', 'Кардио', 'Разминка', 'Похудение', 'Йога', 
      'Пилатес', 'Кроссфит', 'Растяжка', 'Бокс', 'Танцы',
      'Плавание', 'Велосипед', 'Бег', 'Медитация', 'Гибкость',
      'Осанка', 'Пресс', 'Спина', 'Ноги', 'Руки',
      'Грудь', 'Плечи', 'Функционал', 'HIIT', 'Табата'
    ];

    final allCategories = List.generate(categoryNames.length, (index) => WorkoutCategory(
      id: index + 1, 
      name: categoryNames[index], 
      image: _categoryImagePath, 
      programs: _generatePrograms(index + 1)
    ));

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
  Future<List<WorkoutProgram>> getProgramsByCategory(int categoryId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _generatePrograms(categoryId);
  }

  @override
  Future<WorkoutProgram> getProgramDetails(int programId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _generateSingleProgram(programId);
  }

  List<WorkoutProgram> _generatePrograms(int catId) {
    return List.generate(6, (index) => _generateSingleProgram(index + catId * 10));
  }

  WorkoutProgram _generateSingleProgram(int id) {
    return WorkoutProgram(
      id: id,
      title: 'Программа тренировки #$id',
      rating: 4.8,
      trainerName: 'Vivere Pro Trainer',
      trainerImage: _trainerImagePath,
      image: _programImagePath,
      description: 'Эффективная программа для достижения ваших целей в кратчайшие сроки.',
      level: 'Продвинутый',
      equipment: 'Гантели, коврик',
      durationMinutes: 40,
      exercises: List.generate(5, (i) => ExerciserInProgram(
        id: i + (id * 100),
        name: i % 2 == 0 ? 'Упражнение ${i + 1}' : 'Приседания',
        description: 'Выполняйте упражнение плавно, следя за техникой и дыханием.',
        image: i % 2 == 0 ? 'assets/images/exercises/workout_1.png' : 'assets/images/exercises/workout_2.png',
        repeats: [
          if (i % 2 == 0)
            Repeated(id: 1, weight: 20, seconds: 30)
          else
            Repeated(id: 1, weight: 15, reps: 12),
        ],
      )),
    );
  }
}
