// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDtoImpl _$$CategoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      imageUrl: json['image_url'] as String?,
      programs: (json['programs'] as List<dynamic>?)
          ?.map((e) => ProgramDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryDtoImplToJson(_$CategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'programs': instance.programs,
    };

_$ProgramDtoImpl _$$ProgramDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProgramDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String,
      imageUrl: json['image_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      trainerName: json['trainer_name'] as String?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProgramDtoImplToJson(_$ProgramDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'image_url': instance.imageUrl,
      'rating': instance.rating,
      'trainer_name': instance.trainerName,
      'exercises': instance.exercises,
    };

_$ExerciseDtoImpl _$$ExerciseDtoImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      videoUrl: json['video_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$$ExerciseDtoImplToJson(_$ExerciseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'video_url': instance.videoUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };
