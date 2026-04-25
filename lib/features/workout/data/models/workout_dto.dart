import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_dto.freezed.dart';
part 'workout_dto.g.dart';

@freezed
class RepeatedDto with _$RepeatedDto { // В Go это Repeated
  const factory RepeatedDto({
    required int id,
    required int weight,
  }) = _RepeatedDto;

  factory RepeatedDto.fromJson(Map<String, dynamic> json) => _$RepeatedDtoFromJson(json);
}

@freezed
class ExerciserDto with _$ExerciserDto { // В Go это Exerciser
  @JsonSerializable(explicitToJson: true)
  const factory ExerciserDto({
    required int id,
    required String name,
    required String description,
    required String image,
    List<RepeatedDto>? repeats, // Подходы
  }) = _ExerciserDto;

  factory ExerciserDto.fromJson(Map<String, dynamic> json) => _$ExerciserDtoFromJson(json);
}

@freezed
class ProgramDto with _$ProgramDto { // В Go это Workout
  @JsonSerializable(explicitToJson: true)
  const factory ProgramDto({
    required int id,
    required String name,
    required String description,
    List<ExerciserDto>? exercises, // Список Exerciser
  }) = _ProgramDto;

  factory ProgramDto.fromJson(Map<String, dynamic> json) => _$ProgramDtoFromJson(json);
}

@freezed
class CategoryDto with _$CategoryDto {
  @JsonSerializable(explicitToJson: true)
  const factory CategoryDto({
    required int id,
    required String name, // В Go это Name
    required String image, // В Go это Image
    List<ProgramDto>? programs, // В Go категория содержит Exercisers
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
}