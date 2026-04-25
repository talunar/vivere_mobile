import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';

class MockWorkoutRepository implements IWorkoutRepository {
  // Общая картинка для программ (из твоего макета)
  final String _mockImageUrl = 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?q=80&w=1000&auto=format&fit=crop';

  @override
  Future<List<WorkoutCategory>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      WorkoutCategory(id: 1, name: 'Силовые', image: '', programs: []),
      WorkoutCategory(id: 2, name: 'Кардио', image: '', programs: []),
      WorkoutCategory(id: 3, name: 'Йога', image: '', programs: []),
    ];
  }

  @override
  Future<WorkoutCategory> getCategory(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final programs = await getProgramsByCategory(id);
    return WorkoutCategory(id: id, name: 'Категория $id', image: '', programs: programs);
  }

  @override
  Future<List<WorkoutProgram>> getProgramsByCategory(int categoryId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.generate(10, (index) => WorkoutProgram(
      id: index, // Передаем int
      title: 'Учимся кататься на лыжах #$index',
      description: 'Гоняем на лыжах',
      rating: 4.8,
      trainerName: 'Совунья',
      exercises: [],
    ));
  }

  @override
  Future<WorkoutProgram> getProgramDetails(int programId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return WorkoutProgram(
      id: programId,
      title: 'Прыг-скок',
      description: 'Огненная крутая тренировка для ног',
      rating: 4.9,
      trainerName: 'Крош',
      exercises: [],
    );
  }
}