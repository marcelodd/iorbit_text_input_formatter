extension StringExtension on String {
  String trySubstring(int start, [int end]) {
    if (this.length >= end ?? 0) {
      return this.substring(start, end);
    } else if (this.length >= start && this.length < end ?? 0) {
      return this.substring(start, this.length);
    } else if (this.length < start) {
      return '';
    }
    return this.substring(start, end);
  }
}
