import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeated.freezed.dart';

@freezed
class Repeated with _$Repeated {
  const factory Repeated({
    required int id,
    required int weight,
    // TODO если на бэк добавится reps - нужно добавить
  }) = _Repeated;
}