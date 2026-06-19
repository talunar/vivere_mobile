import 'package:flutter_test/flutter_test.dart';
import 'package:vivere_mobile/core/presentation/utils/date_input_formatter.dart';

void main() {
  final formatter = DateInputFormatter();

  group('DateInputFormatter', () {
    test('should add dot after 2 digits', () {
      const oldValue = TextEditingValue(text: '1');
      const newValue = TextEditingValue(text: '11');
      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(result.text, '11.');
    });

    test('should add dots for full date', () {
      const oldValue = TextEditingValue(text: '');
      const newValue = TextEditingValue(text: '01011990');
      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(result.text, '01.01.1990');
    });

    test('should allow deletion', () {
      const oldValue = TextEditingValue(text: '01.');
      const newValue = TextEditingValue(text: '01');
      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(result.text, '01');
    });

    test('should limit length to 10 characters', () {
      const oldValue = TextEditingValue(text: '01.01.1990');
      const newValue = TextEditingValue(text: '01.01.19901');
      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(result.text, '01.01.1990');
    });
  });
}
