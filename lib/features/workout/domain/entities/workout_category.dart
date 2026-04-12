import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_category.freezed.dart';

@freezed
class WorkoutCategory with _$WorkoutCategory {
  const factory WorkoutCategory({
    required int id,
    required String name,
    required String image,
    required List<int> exerciseIds, // Ссылка на упражнения по ID
  }) = _WorkoutCategory;
}