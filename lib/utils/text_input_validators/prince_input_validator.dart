import 'package:ads_app/types/form_input_validator.dart';
import 'package:ads_app/utils/only_digits.dart';
import 'package:ads_app/utils/text_input_validators/not_empty_text_input_validator.dart';

FormInputValidator<String> priceInputValidator = (String? value) {
  String? emptyErrorMessage = notEmptyTextInputValidator(value);
  if (emptyErrorMessage != null) return emptyErrorMessage;

  int cents = int.parse(onlyDigits(value!));

  if (cents <= 0) {
    return 'Informe um preço maior que zero';
  }

  return null;
};
