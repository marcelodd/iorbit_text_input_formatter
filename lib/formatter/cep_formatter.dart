import 'package:flutter/services.dart';
import '../utils/utils.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var _value = newValue.text.replaceAll(new RegExp(r'[^0-9]+'), '');
    if (_value.length > 8) return oldValue;
    var part1 = _value.trySubstring(0, 5);
    var part2 = _value.trySubstring(5, 8);
    _value = "$part1${part2.length > 0 ? '-' : ''}$part2";
    return newValue.copyWith(
        text: _value,
        selection: TextSelection.collapsed(offset: _value.length));
  }
}
