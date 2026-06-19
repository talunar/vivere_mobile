import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_dto.freezed.dart';
part 'workout_dto.g.dart';

@freezed
class RepeatedDto with _$RepeatedDto {
  const factory RepeatedDto({
    required int id,
    required int weight,
    int? reps,
    int? seconds,
  }) = _RepeatedDto;

  factory RepeatedDto.fromJson(Map<String, dynamic> json) => _$RepeatedDtoFromJson(json);
}

@freezed
class ExerciserDto with _$ExerciserDto {
  @JsonSerializable(explicitToJson: true)
  const factory ExerciserDto({
    required int id,
    required String name,
    required String description,
    required String image,
    List<RepeatedDto>? repeats,
  }) = _ExerciserDto;

  factory ExerciserDto.fromJson(Map<String, dynamic> json) => _$ExerciserDtoFromJson(json);
}

@freezed
class WorkoutDto with _$WorkoutDto {
  @JsonSerializable(explicitToJson: true)
  const factory WorkoutDto({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'exercises') List<ExerciserDto>? exercises,
  }) = _WorkoutDto;

  factory WorkoutDto.fromJson(Map<String, dynamic> json) => _$WorkoutDtoFromJson(json);
}

@freezed
class ProgramDto with _$ProgramDto {
  @JsonSerializable(explicitToJson: true)
  const factory ProgramDto({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'workouts') List<WorkoutDto>? workouts,
  }) = _ProgramDto;

  factory ProgramDto.fromJson(Map<String, dynamic> json) => _$ProgramDtoFromJson(json);
}

@freezed
class CategoryDto with _$CategoryDto {
  @JsonSerializable(explicitToJson: true)
  const factory CategoryDto({
    required int id,
    required String name,
    required String image,
    @JsonKey(name: 'is_main_screen') bool? isMainScreen, // Поле из Python
    @JsonKey(name: 'exercises') List<ProgramDto>? programs,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
}
