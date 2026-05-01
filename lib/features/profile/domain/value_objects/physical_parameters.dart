import '../../../../core/domain/failures/failure.dart';

extension type const Weight(double value) {
  void validate() {
    if (value <= 0) throw const ValidationFailure('Вес должен быть положительным числом');
    if (value > 600) throw const ValidationFailure('Указан нереалистичный вес');
  }
}

extension type const Height(double value) {
  void validate() {
    if (value <= 0) throw const ValidationFailure('Рост должен быть положительным числом');
    if (value > 300) throw const ValidationFailure('Указан нереалистичный рост');
  }
}
