// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      defaultReps: (json['defaultReps'] as num).toInt(),
      defaultWeight: (json['defaultWeight'] as num).toDouble(),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'defaultReps': instance.defaultReps,
      'defaultWeight': instance.defaultWeight,
    };
