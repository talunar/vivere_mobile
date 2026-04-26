import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/workout_repository_impl.dart';
import '../../domain/entities/workout_category.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';
import 'package:vivere_mobile/core/network/dio_provider.dart';
import '../../data/repositories/mock_workout_repository.dart'; // Импортируем мок

part 'workout_providers.g.dart';

/// Провайдер репозитория (внутренний)
/// TODO Возвращаю мок вместо реальных данных - реализовать, после подключения к бэку
@riverpod
IWorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  // final dio = ref.watch(dioProvider);
  // return WorkoutRepositoryImpl(dio);
  return MockWorkoutRepository();
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