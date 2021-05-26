import 'package:flutter/services.dart';
import '../utils/utils.dart';

class FoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var _value = newValue.text.replaceAll(new RegExp(r'[^0-9]+'), '');

    if (_value.length > 11) return oldValue;

    if (_value.length <= 10) {
      var part1 = _value.trySubstring(0, 2);
      var part2 = _value.trySubstring(2, 6);
      var part3 = _value.trySubstring(6, 10);
      _value =
          "${part1.length > 0 ? '(' : ''}$part1${part2.length > 0 ? ') ' : ''}$part2${part3.length > 0 ? ''
              '-' : ''}$part3";
    } else {
      var part1 = _value.trySubstring(0, 2);
      var part2 = _value.trySubstring(2, 7);
      var part3 = _value.trySubstring(7, 11);
      _value =
          "${part1.length > 0 ? '(' : ''}$part1${part2.length > 0 ? ') ' : ''}$part2${part3.length > 0 ? ''
              '-' : ''}$part3";
    }

    return newValue.copyWith(
        text: _value,
        selection: TextSelection.collapsed(offset: _value.length));
  }
}
