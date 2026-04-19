import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_dto.freezed.dart';
part 'workout_dto.g.dart';

@freezed
class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    required int id,
    required String title,
    @JsonKey(name: 'image_url') String? imageUrl,
    List<ProgramDto>? programs, // Вложенные программы
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
}

@freezed
class ProgramDto with _$ProgramDto {
  const factory ProgramDto({
    required int id,
    required String title,
    String? description,
    required String difficulty,
    @JsonKey(name: 'image_url') String? imageUrl,    // Добавили
    double? rating,                                  // Добавили
    @JsonKey(name: 'trainer_name') String? trainerName, // Добавили
    List<ExerciseDto>? exercises,
  }) = _ProgramDto;

  factory ProgramDto.fromJson(Map<String, dynamic> json) => _$ProgramDtoFromJson(json);
}

@freezed
class ExerciseDto with _$ExerciseDto {
  const factory ExerciseDto({
    required int id,
    required String title,
    String? description,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
  }) = _ExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) => _$ExerciseDtoFromJson(json);
}