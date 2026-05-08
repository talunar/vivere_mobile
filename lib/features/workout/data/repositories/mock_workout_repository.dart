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
<<<<<<< Updated upstream
      id: programId,
      title: 'Прыг-скок',
      description: 'Огненная крутая тренировка для ног',
      rating: 4.9,
      trainerName: 'Крош',
      exercises: [],
=======
      id: id,
      title: 'Программа тренировки',
      rating: 4.8,
      trainerName: 'Super train 3000',
      trainerImage: _trainerImageUrl,
      image: _mockImageUrl,
      description: 'Таким образом, убеждённость некоторых оппонентов требует определения и уточнения как самодостаточных.',
      level: 'Продвинутый',
      equipment: 'Гантели, коврик, сила воли и хорошее настроение',
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
>>>>>>> Stashed changes
    );
  }
}