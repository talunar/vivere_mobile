import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/workout_repository_impl.dart';
import '../../data/repositories/user_exercises_repository_impl.dart';
import '../../data/repositories/mock_workout_repository.dart';
import '../../data/sources/user_exercises_mock_data_source.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';
import '../../domain/repositories/i_user_exercises_repository.dart';

part 'workout_providers.g.dart';

@riverpod
IWorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  return MockWorkoutRepository();
}

@riverpod
IUserExercisesRepository userExercisesRepository(UserExercisesRepositoryRef ref) {
  return UserExercisesRepositoryImpl(UserExercisesMockDataSource());
}

/// Список всех категорий
@riverpod
Future<List<WorkoutCategory>> workoutCategories(WorkoutCategoriesRef ref) {
  return ref.watch(workoutRepositoryProvider).getCategories();
}

/// Получение конкретной категории (с превью программ)
@riverpod
Future<WorkoutCategory> workoutCategory(WorkoutCategoryRef ref, int id) {
  return ref.watch(workoutRepositoryProvider).getCategory(id);
}

/// Все программы выбранной категории
@riverpod
Future<List<WorkoutProgram>> programsByCategory(ProgramsByCategoryRef ref, int categoryId) {
  return ref.watch(workoutRepositoryProvider).getProgramsByCategory(categoryId);
}

/// Полные детали программы (упражнения, описание, подходы)
@riverpod
Future<WorkoutProgram> workoutProgramDetails(WorkoutProgramDetailsRef ref, int id) {
  return ref.watch(workoutRepositoryProvider).getProgramDetails(id);
}

/// Управление программами
@riverpod
class UserPrograms extends _$UserPrograms {
  @override
  Future<List<WorkoutProgram>> build(int userId) async {
    final repository = ref.watch(userExercisesRepositoryProvider);
    final exercises = await repository.getUserExercises(userId);

    return exercises.map((e) => WorkoutProgram(
      id: e.id,
      title: e.name,
      description: e.description,
      exercises: [e],
      durationMinutes: 15,
      rating: 5.0,
    )).toList();
  }

  Future<void> addProgram(WorkoutProgram program) async {
    final currentState = state.value ?? [];
    if (currentState.any((p) => p.id == program.id)) return;

    state = const AsyncLoading();
    try {
      final repository = ref.read(userExercisesRepositoryProvider);
      await repository.addExercise(userId, program.exercises.first);
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteProgram(int programId) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(userExercisesRepositoryProvider);
      await repository.deleteExercise(programId);
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
