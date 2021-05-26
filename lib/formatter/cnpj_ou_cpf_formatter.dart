import 'package:flutter/services.dart';
import '../utils/utils.dart';

class CnpjOuCpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var _value = newValue.text.replaceAll(new RegExp(r'[^0-9]+'), '');

    if (_value.length > 14) return oldValue;

    if (_value.length <= 11) {
      var part1 = _value.trySubstring(0, 3);
      var part2 = _value.trySubstring(3, 6);
      var part3 = _value.trySubstring(6, 9);
      var part4 = _value.trySubstring(9, 11);
      _value =
          "$part1${part2.length > 0 ? '.' : ''}$part2${part3.length > 0 ? ''
              '.' : ''}$part3${part4.length > 0 ? '-' : ''}$part4";
    } else {
      var part1 = _value.trySubstring(0, 2);
      var part2 = _value.trySubstring(2, 5);
      var part3 = _value.trySubstring(5, 8);
      var part4 = _value.trySubstring(8, 12);
      var part5 = _value.trySubstring(12, 14);
      _value = "$part1${part2.length > 0 ? '.' : ''}$part2${part3.length > 0 ? ''
          '.' : ''}$part3${part4.length > 0 ? '/' : ''}$part4${part5.length > 0 ? '-' : ''}$part5";
    }

    return newValue.copyWith(
        text: _value,
        selection: TextSelection.collapsed(offset: _value.length));
  }
}
