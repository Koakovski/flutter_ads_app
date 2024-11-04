import 'package:ads_app/types/form_input_validator.dart';

FormInputValidator<String> notEmptyTextInputValidator = (String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Este campo não pode ser vazio';
  }

  return null;
};
