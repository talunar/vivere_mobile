import '../failures/failure.dart';

/// Валидация email
extension type const Email(String value) {
  void validate() {
    final trimmed = value.trim();
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(trimmed)) {
      throw const ValidationFailure('Некорректный формат почты');
    }
  }
}

/// Валидация логина
extension type const NickName(String value) {  void validate() {
  final trimmed = value.trim();
  if (trimmed.length < 3) throw const ValidationFailure('Слишком короткий ник');
  if (trimmed.length >= 25) throw const ValidationFailure('Ник должен быть короче 25 символов');
  if (trimmed.contains(' ')) throw const ValidationFailure('Без пробелов');
 }
}

extension type const Password(String value) {
  void validate() {
    if (value.length < 8 || value.length > 32) {
      throw const ValidationFailure('Пароль должен быть от 8 до 32 символов');
    }
  }
}

/// Валидация имени или фамилии
extension type const Name(String value) {
  void validate() {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      throw const ValidationFailure('Поле не может быть пустым');
    }
    if (trimmed.length < 2) {
      throw const ValidationFailure('Слишком короткое имя (минимум 2 символа)');
    }
    // Запрещаем цифры в именах
    if (RegExp(r'[0-9]').hasMatch(trimmed)) {
      throw const ValidationFailure('Имя не может содержать цифры');
    }
  }
}

/// Валидация возраста
extension type const Age(int value) {
  void validate() {
    if (value < 5 || value > 120) {
      throw const ValidationFailure('Возраст должен быть в реальным');
    }
  }
}
