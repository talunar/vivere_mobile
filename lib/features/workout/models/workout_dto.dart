import 'package:freezed_annotation/freezed_annotation.dart';
import '/features/workout/domain/entities/workout_category.dart';
import '/features/workout/domain/entities/exercise.dart';
import '/features/workout/domain/entities/workout_program.dart';

part 'workout_dto.freezed.dart';
part 'workout_dto.g.dart';

@freezed
class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required int id,
    required String name,
    required String image,
    required List<ExerciseDto> exercises,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
}

@freezed
class ExerciseDto with _$ExerciseDto {
  const factory ExerciseDto({
    required int id,
    required String name,
    required String image,
    required String description,
    @JsonKey(name: 'workouts') List<ProgramDto>? programs,
  }) = _ExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) => _$ExerciseDtoFromJson(json);
}

@freezed
class ProgramDto with _$ProgramDto {
  const factory ProgramDto({
    required int id,
    required String name,
    required String description,
  }) = _ProgramDto;

  factory ProgramDto.fromJson(Map<String, dynamic> json) => _$ProgramDtoFromJson(json);
}