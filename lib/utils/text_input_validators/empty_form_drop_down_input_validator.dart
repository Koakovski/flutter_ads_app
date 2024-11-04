import 'package:ads_app/types/form_input_validator.dart';

FormInputValidator<dynamic> emptyFormDropDownInputValidator = (dynamic value) {
  if (value == null) {
    return 'Selecione um item';
  }

  return null;
};
