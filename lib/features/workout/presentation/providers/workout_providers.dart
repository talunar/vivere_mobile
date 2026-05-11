import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vivere_mobile/features/workout/data/repositories/user_exercises_repository_impl.dart';
import 'package:vivere_mobile/features/workout/data/repositories/mock_workout_repository.dart';
import 'package:vivere_mobile/features/workout/data/sources/user_exercises_mock_data_source.dart';
import 'package:vivere_mobile/features/workout/domain/entities/workout_category.dart';
import 'package:vivere_mobile/features/workout/domain/entities/workout_program.dart';
import 'package:vivere_mobile/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:vivere_mobile/features/workout/domain/repositories/i_user_exercises_repository.dart';

part 'workout_providers.g.dart';

@riverpod
IWorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  return MockWorkoutRepository();
}

@riverpod
IUserExercisesRepository userExercisesRepository(UserExercisesRepositoryRef ref) {
  return UserExercisesRepositoryImpl(UserExercisesMockDataSource());
}

/// ПАГИНАЦИЯ КАТЕГОРИЙ
@riverpod
class PaginatedWorkoutCategories extends _$PaginatedWorkoutCategories {
  int _offset = 0;
  final int _limit = 5;
  bool _hasReachedMax = false;

  @override
  Future<List<WorkoutCategory>> build() async {
    return _fetch();
  }

  Future<List<WorkoutCategory>> _fetch() async {
    final repo = ref.read(workoutRepositoryProvider);
    return repo.getCategories(limit: _limit, offset: _offset);
  }

  Future<void> fetchNextPage() async {
    if (_hasReachedMax || state.isLoading) return;

    final previousState = state.value ?? [];
    state = const AsyncLoading<List<WorkoutCategory>>().copyWithPrevious(state);
    
    _offset += _limit;
    
    state = await AsyncValue.guard(() async {
      final newItems = await _fetch();
      if (newItems.isEmpty) {
        _hasReachedMax = true;
        return previousState;
      }
      return [...previousState, ...newItems];
    });
  }
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

/// Управление программами пользователя
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
      image: e.image,
    )).toList();
  }

  Future<void> addProgram(WorkoutProgram program) async {
    try {
      final repository = ref.read(userExercisesRepositoryProvider);
      await repository.addExercise(userId, program.exercises.first);
      ref.invalidateSelf();
    } catch (e) {
      // Обработка ошибки
    }
  }

  Future<void> deleteProgram(int programId) async {
    try {
      final repository = ref.read(userExercisesRepositoryProvider);
      await repository.deleteExercise(programId);
      ref.invalidateSelf();
    } catch (e) {
      // Обработка ошибки
    }
  }

  // Групповое сохранение прогресса после тренировки
  Future<void> saveAllProgress(List<ExerciserInProgram> exercises) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(userExercisesRepositoryProvider);
      for (var exercise in exercises) {
        await repository.updateExercise(exercise);
      }
      // Перезапрашиваем данные, чтобы UI обновился
      final updatedExercises = await repository.getUserExercises(userId);
      return updatedExercises.map((e) => WorkoutProgram(
        id: e.id,
        title: e.name,
        description: e.description,
        exercises: [e],
        durationMinutes: 15,
        rating: 5.0,
        image: e.image,
      )).toList();
    });
  }
}
