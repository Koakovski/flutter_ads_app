import 'package:ads_app/types/form_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter> textFormatters;
  final int maxlines;
  final List<FormInputValidator<String>> validators;
  final TextInputType? keyboardType;

  FormInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.textFormatters = const [],
    this.validators = const [],
    this.maxlines = 1,
    this.keyboardType,
  });

  final InputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.grey[300]!,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: textFormatters,
      maxLines: maxlines,
      style: TextStyle(
        color: Colors.grey[700]!,
      ),
      validator: (value) {
        return validators
            .map((validate) => validate(value))
            .firstWhere((error) => error != null, orElse: () => null);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: defaultBorder,
        focusedBorder: defaultBorder,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[700]!,
        ),
      ),
    );
  }
}
