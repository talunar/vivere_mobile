import '../entities/workout_program.dart';

// Выводим список программ не смотря ни на что
abstract class IWorkoutRepository {
  Future<List<WorkoutProgram>> getTopPrograms();
}