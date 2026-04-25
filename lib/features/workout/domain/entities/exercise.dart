import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/repeated.dart';

part 'exercise.freezed.dart';

@freezed
class Exerciser with _$Exerciser {
  const factory Exerciser({
    required int id,
    required String name,
    required String description,
    required String image,
    required List<Repeated> repeats,
  }) = _Exerciser;
}