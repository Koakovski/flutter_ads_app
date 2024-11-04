String onlyDigits(String value) {
  return value.replaceAll(RegExp(r'[^0-9]'), '');
}
