import 'package:ads_app/types/form_input_validator.dart';
import 'package:flutter/material.dart';

typedef FormDropdownItemBuilder<T> = DropdownMenuItem<T> Function(T);

class FormDropdown<I> extends StatelessWidget {
  final String hint;
  final I? selectedItem;
  final List<I> items;
  final ValueChanged<I?>? onChanged;
  final FormDropdownItemBuilder<I> itemBuilder;
  final List<FormInputValidator<I>> validators;

  FormDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.validators = const [],
    this.selectedItem,
  });

  final InputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(
      color: Colors.grey[300]!,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<I>(
      hint: Text(hint),
      value: selectedItem,
      onChanged: onChanged,
      items: items.map((item) => itemBuilder(item)).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: defaultBorder,
        enabledBorder: defaultBorder,
        focusedBorder: defaultBorder,
      ),
      validator: (value) {
        return validators
            .map((validate) => validate(value))
            .firstWhere((error) => error != null, orElse: () => null);
      },
    );
  }
}
