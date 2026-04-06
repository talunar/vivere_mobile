// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutProgramImpl _$$WorkoutProgramImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutProgramImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      rating: (json['rating'] as num).toDouble(),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainerName: json['trainerName'] as String,
      imageUrl: json['imageUrl'] as String,
      isVisible: json['isVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$$WorkoutProgramImplToJson(
  _$WorkoutProgramImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'rating': instance.rating,
  'exercises': instance.exercises,
  'trainerName': instance.trainerName,
  'imageUrl': instance.imageUrl,
  'isVisible': instance.isVisible,
};
