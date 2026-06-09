class AppValidators {
  static String? _validateText(String? value, String fieldName, {int minLength = 2}) {
    if (value == null || value.trim().isEmpty) return 'Введите $fieldName';
    if (value.length < minLength) return 'Минимум $minLength символа';
    if (RegExp(r'[0-9]').hasMatch(value)) return 'Не может содержать цифры';
    return null;
  }

  static String? name(String? value) => _validateText(value, 'имя');
  static String? lastName(String? value) => _validateText(value, 'фамилию');

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
    final normalizedValue = value.replaceAll(',', '.');
    final n = double.tryParse(normalizedValue);
    if (n == null) return 'Это должно быть число';
    if (min != null && n < min) return 'Минимум: $min';
    if (max != null && n > max) return 'Максимум: $max';
    return null;
  }

  static String? nickName(String? value) {
    if (value == null || value.isEmpty) return 'Введите логин';
    if (value.length < 3) return 'Минимум 3 символа';
    if (value.contains(' ')) return 'Без пробелов';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Введите пароль';
    if (value.length < 8) return 'Минимум 8 символов';
    if (value.length > 32) return 'Максимум 32 символа';
    return null;
  }

  static String? date(String? value) {
    if (value == null || value.isEmpty) return 'Введите дату';
    final dateRegex = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
    if (!dateRegex.hasMatch(value)) return 'Формат: дд.мм.гггг';
    
    final parts = value.split('.');
    if (parts.length != 3) return 'Формат: дд.мм.гггг';

    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    
    if (day == null || month == null || year == null) return 'Некорректная дата';
    if (month < 1 || month > 12) return 'Некорректный месяц';
    if (day < 1 || day > 31) return 'Некорректный день';
    
    final now = DateTime.now();
    if (year < 1900 || year > now.year) return 'Некорректный год';
    
    try {
      final date = DateTime(year, month, day);
      if (date.isAfter(now)) return 'Дата в будущем';
    } catch (_) {
      return 'Некорректная дата';
    }

    return null;
  }
}
