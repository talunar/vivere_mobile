// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDtoImpl _$$CategoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryDtoImplToJson(_$CategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'exercises': instance.exercises,
    };

_$ExerciseDtoImpl _$$ExerciseDtoImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      programs: (json['workouts'] as List<dynamic>?)
          ?.map((e) => ProgramDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExerciseDtoImplToJson(_$ExerciseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'workouts': instance.programs,
    };

_$ProgramDtoImpl _$$ProgramDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProgramDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ProgramDtoImplToJson(_$ProgramDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
