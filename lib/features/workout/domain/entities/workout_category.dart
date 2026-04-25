import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/workout_program.dart';

part 'workout_category.freezed.dart';

@freezed
class WorkoutCategory with _$WorkoutCategory {
  const factory WorkoutCategory({
    required int id,
    required String name,
    required String image,
    String? description,
    required List<WorkoutProgram> programs, // Ссылка на упражнения по ID
  }) = _WorkoutCategory;
}