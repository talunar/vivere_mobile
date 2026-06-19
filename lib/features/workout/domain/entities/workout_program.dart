import 'package:freezed_annotation/freezed_annotation.dart';
import 'repeated.dart';

part 'workout_program.freezed.dart';

@freezed
class WorkoutProgram with _$WorkoutProgram {
  const factory WorkoutProgram({
    required int id,
    required String title,
    String? description,
    double? rating,
    String? trainerName,
    String? trainerImage,
    String? image,
    String? level,
    String? equipment,
    int? durationMinutes,
    required List<ExerciserInProgram> exercises,
  }) = _WorkoutProgram;

  const WorkoutProgram._();

  String get displayImage {
    final img = image ?? '';
    if (img.isEmpty) return 'assets/images/programs/workout_1.png';
    if (img.startsWith('http') || img.startsWith('assets/')) return img;
    return 'assets/images/programs/$img';
  }

  String get displayTrainerImage {
    final img = trainerImage ?? '';
    // По умолчанию теперь используем workout_1.png как аватар
    if (img.isEmpty || img.contains('trainer_1.png')) return 'assets/images/avatar/workout_1.png';
    if (img.startsWith('http') || img.startsWith('assets/')) return img;
    return 'assets/images/avatar/$img';
  }
}

@freezed
class ExerciserInProgram with _$ExerciserInProgram {
  const factory ExerciserInProgram({
    required int id,
    required String name,
    required String description,
    required String image,
    required List<Repeated> repeats,
    String? categoryImage,
  }) = _ExerciserInProgram;

  const ExerciserInProgram._();

  bool get isNetworkImage => image.startsWith('http');

  String get displayImage {
    if (image.startsWith('http') || image.startsWith('assets/')) return image;
    return 'assets/images/exercises/$image';
  }
}
