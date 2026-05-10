import '../../domain/entities/repeated.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';

class MockWorkoutRepository implements IWorkoutRepository {
  final String _mockImageUrl = 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?q=80&w=1000&auto=format&fit=crop';
  final String _trainerImageUrl = 'https://images.unsplash.com/photo-1594381898411-846e7d193883?q=80&w=200&auto=format&fit=crop';

  @override
  Future<List<WorkoutCategory>> getCategories({int limit = 10, int offset = 0}) async {
    await Future.delayed(const Duration(milliseconds: 600));

    // Имитируем большую базу данных категорий (например, 25 штук)
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
      image: _mockImageUrl, 
      programs: _generatePrograms(index + 1)
    ));

    // Применяем пагинацию (offset и limit)
    if (offset >= allCategories.length) return [];
    
    final end = (offset + limit) > allCategories.length 
        ? allCategories.length 
        : (offset + limit);
        
    return allCategories.sublist(offset, end);
  }

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    // Для простоты мока загружаем небольшой список и ищем нужную
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
      trainerName: 'Super train 3000',
      trainerImage: _trainerImageUrl,
      image: _mockImageUrl,
      description: 'Таким образом, убеждённость некоторых оппонентов требует определения и уточнения как самодостаточных.',
      level: 'Продвинутый',
      equipment: 'Гантели, коврик',
      durationMinutes: 40,
      exercises: List.generate(5, (i) => ExerciserInProgram(
        id: i,
        name: i % 2 == 0 ? 'Упражнение ${i + 1}' : 'Приседания',
        description: 'Таким образом, убеждённость некоторых оппонентов требует определения и уточнения как самодостаточных.',
        image: _mockImageUrl,
        repeats: [
          if (i % 2 == 0)
            Repeated(id: 1, weight: 20, seconds: 15)
          else
            Repeated(id: 1, weight: 20, reps: 12),
        ],
      )),
    );
  }
}
