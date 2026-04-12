import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required int id,
    required String name,
    required String image,
    required String description,
  }) = _Exercise;
}