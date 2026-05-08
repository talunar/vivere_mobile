import 'package:riverpod_annotation/riverpod_annotation.dart';
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

@riverpod
Future<List<WorkoutCategory>> workoutCategories(WorkoutCategoriesRef ref) {
  return ref.watch(workoutRepositoryProvider).getCategories();
}

@riverpod
Future<WorkoutCategory> workoutCategory(WorkoutCategoryRef ref, int id) {
  return ref.watch(workoutRepositoryProvider).getCategory(id);
}

@riverpod
Future<List<WorkoutProgram>> programsByCategory(ProgramsByCategoryRef ref, int categoryId) {
  return ref.watch(workoutRepositoryProvider).getProgramsByCategory(categoryId);
}

@riverpod
Future<WorkoutProgram> workoutProgramDetails(WorkoutProgramDetailsRef ref, int id) {
  return ref.watch(workoutRepositoryProvider).getProgramDetails(id);
}

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
    final repository = ref.read(userExercisesRepositoryProvider);
    state = const AsyncLoading();
    
    try {
      // Мапим программу обратно в упражнение (как ожидает Go)
      final exercise = program.exercises.first; 
      await repository.addExercise(userId, exercise);
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteProgram(int programId) async {
    final repository = ref.read(userExercisesRepositoryProvider);
    state = const AsyncLoading();
    
    try {
      await repository.deleteExercise(programId);
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
