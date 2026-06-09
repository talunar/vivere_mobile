// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepeatedDtoImpl _$$RepeatedDtoImplFromJson(Map<String, dynamic> json) =>
    _$RepeatedDtoImpl(
      id: (json['id'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      reps: (json['reps'] as num?)?.toInt(),
      seconds: (json['seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RepeatedDtoImplToJson(_$RepeatedDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'reps': instance.reps,
      'seconds': instance.seconds,
    };

_$ExerciserDtoImpl _$$ExerciserDtoImplFromJson(Map<String, dynamic> json) =>
    _$ExerciserDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      repeats: (json['repeats'] as List<dynamic>?)
          ?.map((e) => RepeatedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExerciserDtoImplToJson(_$ExerciserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'repeats': instance.repeats?.map((e) => e.toJson()).toList(),
    };

_$WorkoutDtoImpl _$$WorkoutDtoImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => ExerciserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutDtoImplToJson(_$WorkoutDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'exercises': instance.exercises?.map((e) => e.toJson()).toList(),
    };

_$ProgramDtoImpl _$$ProgramDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProgramDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      workouts: (json['workouts'] as List<dynamic>?)
          ?.map((e) => WorkoutDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProgramDtoImplToJson(_$ProgramDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'workouts': instance.workouts?.map((e) => e.toJson()).toList(),
    };

_$CategoryDtoImpl _$$CategoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      programs: (json['exercises'] as List<dynamic>?)
          ?.map((e) => ProgramDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryDtoImplToJson(_$CategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'exercises': instance.programs?.map((e) => e.toJson()).toList(),
    };
