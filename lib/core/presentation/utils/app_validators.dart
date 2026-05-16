class AppValidators {
  static String? required(String? value, [String message = 'Обязательное поле']) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Введите почту';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Некорректный формат почты';
    return null;
  }

  static String? number(String? value, {double? min, double? max}) {
    if (value == null || value.isEmpty) return 'Введите число';
    final n = double.tryParse(value);
    if (n == null) return 'Это должно быть число';
    if (min != null && n < min) return 'Минимум: $min';
    if (max != null && n > max) return 'Максимум: $max';
    return null;
  }

  static String? nickName(String? value) {
    if (value == null || value.isEmpty) return 'Введите никнейм';
    if (value.length < 3) return 'Минимум 3 символа';
    if (value.contains(' ')) return 'Без пробелов';
    return null;
  }
}
