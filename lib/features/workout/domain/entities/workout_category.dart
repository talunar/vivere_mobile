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
    @Default(false) bool isMainScreen,
    required List<WorkoutProgram> programs,
  }) = _WorkoutCategory;

  const WorkoutCategory._();

  String get displayImage {
    if (image.startsWith('http') || image.startsWith('assets/')) {
      return image;
    }
    // Если придет просто имя файла с бэкенда
    return 'assets/images/categories/$image';
  }
}
