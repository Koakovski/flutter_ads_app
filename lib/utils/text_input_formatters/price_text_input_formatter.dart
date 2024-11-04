import 'package:ads_app/utils/only_digits.dart';
import 'package:ads_app/utils/price_in_cents_formatter.dart';
import 'package:flutter/services.dart';

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = onlyDigits(newValue.text);

    if (newText.isEmpty) newText = '0';

    int value = int.parse(newText);
    String formatted = priceInCentsFormatter(value);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
