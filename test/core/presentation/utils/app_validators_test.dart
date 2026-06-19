import 'package:flutter_test/flutter_test.dart';
import 'package:vivere_mobile/core/presentation/utils/app_validators.dart';

void main() {
  group('AppValidators.email', () {
    test('should return null for valid email', () {
      expect(AppValidators.email('test@example.com'), null);
    });

    test('should return error for empty email', () {
      expect(AppValidators.email(''), 'Введите почту');
    });

    test('should return error for invalid email format', () {
      expect(AppValidators.email('invalid-email'), 'Некорректный формат почты');
    });
  });

  group('AppValidators.date', () {
    test('should return null for valid date', () {
      expect(AppValidators.date('01.01.1990'), null);
    });

    test('should return error for invalid format', () {
      expect(AppValidators.date('01-01-1990'), 'Формат: дд.мм.гггг');
    });

    test('should return error for future date', () {
      expect(AppValidators.date('01.01.2099'), 'Дата в будущем');
    });
  });

  group('AppValidators.number', () {
    test('should return null for valid number within range', () {
      expect(AppValidators.number('70', min: 20, max: 255), null);
    });

    test('should return error if below minimum', () {
      expect(AppValidators.number('10', min: 20), 'Минимум: 20.0');
    });
  });
}
