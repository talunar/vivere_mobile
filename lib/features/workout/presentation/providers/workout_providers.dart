import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/mock_workout_repository.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/repositories/i_workout_repository.dart';

part 'workout_providers.g.dart';

@riverpod
IWorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  return MockWorkoutRepository();
}

@riverpod
Future<List<WorkoutProgram>> topPrograms(TopProgramsRef ref) {
  final repository = ref.watch(workoutRepositoryProvider);
  return repository.getTopPrograms();
}