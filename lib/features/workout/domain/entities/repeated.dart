import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeated.freezed.dart';

@freezed
class Repeated with _$Repeated {
  const factory Repeated({
    required int id,
    required int weight,
    @Default(20) int reps,
    @Default(60) int seconds,
  }) = _Repeated;

  const Repeated._();

  bool get isTimeBased => seconds > 0;
}
