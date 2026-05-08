import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeated.freezed.dart';

@freezed
class Repeated with _$Repeated {
  const factory Repeated({
    required int id,
    required int weight,
    int? reps, // Добавим reps для Шага 4
    int? seconds, // Добавим секунды для упражнений на время
  }) = _Repeated;
}