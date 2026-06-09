import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivere_mobile/core/network/dio_provider.dart';
import 'package:vivere_mobile/features/workout/data/repositories/user_exercises_repository_impl.dart';
import 'package:vivere_mobile/features/workout/data/repositories/mock_workout_repository.dart';
import 'package:vivere_mobile/features/workout/data/sources/i_user_exercises_data_source.dart';
import 'package:vivere_mobile/features/workout/data/sources/user_exercises_mock_data_source.dart';
import 'package:vivere_mobile/features/workout/data/sources/user_exercises_remote_data_source.dart';
import 'package:vivere_mobile/features/workout/domain/entities/workout_category.dart';
import 'package:vivere_mobile/features/workout/domain/entities/workout_program.dart';
import 'package:vivere_mobile/features/workout/domain/repositories/i_workout_repository.dart';
import 'package:vivere_mobile/features/workout/domain/repositories/i_user_exercises_repository.dart';

part 'workout_providers.g.dart';

final expandedCategoryProvider = StateProvider<int?>((ref) => null);

// Сменить на true после подключения
const bool _useRemoteDataSource = false;

@riverpod
IWorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  return MockWorkoutRepository();
}

@riverpod
IUserExercisesDataSource userExercisesDataSource(UserExercisesDataSourceRef ref) {
  if (_useRemoteDataSource) {
    final dio = ref.watch(dioProvider);
    return UserExercisesRemoteDataSource(dio);
  }
  return UserExercisesMockDataSource();
}

@riverpod
IUserExercisesRepository userExercisesRepository(UserExercisesRepositoryRef ref) {
  final dataSource = ref.watch(userExercisesDataSourceProvider);
  return UserExercisesRepositoryImpl(dataSource);
}

/// Пагинация категорий
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

/// Пагинация программ
@riverpod
class PaginatedProgramsByCategory extends _$PaginatedProgramsByCategory {
  int _offset = 0;
  final int _limit = 10;
  bool _hasReachedMax = false;

  @override
  Future<List<WorkoutProgram>> build(int categoryId) async {
    return _fetch(categoryId);
  }

  Future<List<WorkoutProgram>> _fetch(int id) async {
    final repo = ref.read(workoutRepositoryProvider);
    return repo.getProgramsByCategory(id, limit: _limit, offset: _offset);
  }

  Future<void> fetchNextPage() async {
    if (_hasReachedMax || state.isLoading) return;

    final previousState = state.value ?? [];
    state = const AsyncLoading<List<WorkoutProgram>>().copyWithPrevious(state);

    _offset += _limit;

    state = await AsyncValue.guard(() async {
      final newItems = await _fetch(categoryId);
      if (newItems.isEmpty) {
        _hasReachedMax = true;
        return previousState;
      }
      return [...previousState, ...newItems];
    });
  }
}

/// Избранные программы пользователя (сохраняются на бэкенде через UserExercises)
@riverpod
class FavoritePrograms extends _$FavoritePrograms {
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

  Future<void> toggleFavorite(WorkoutProgram program) async {
    final previousState = state;
    final currentPrograms = state.value ?? [];
    final isFavorite = currentPrograms.any((p) => p.id == program.id);

    // Оптимистичное обновление: меняем UI мгновенно
    if (isFavorite) {
      state = AsyncData(currentPrograms.where((p) => p.id != program.id).toList());
    } else {
      state = AsyncData([...currentPrograms, program]);
    }
    
    try {
      final repository = ref.read(userExercisesRepositoryProvider);
      if (isFavorite) {
        await repository.deleteExercise(program.id);
      } else {
        final exerciseToSave = program.exercises.first.copyWith(id: program.id);
        await repository.addExercise(userId, exerciseToSave);
      }
      // Не вызываем invalidateSelf, чтобы избежать мерцания, 
      // так как локальное состояние уже актуально.
    } catch (e) {
      // При ошибке откатываем UI к предыдущему состоянию
      state = previousState;
    }
  }

  Future<void> saveAllProgress(List<ExerciserInProgram> exercises) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(userExercisesRepositoryProvider);
      for (var exercise in exercises) {
        await repository.updateExercise(exercise);
      }
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
