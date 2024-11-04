import 'package:ads_app/classes/category.dart';
import 'package:flutter/material.dart';

class FormDropdownItemCategory extends DropdownMenuItem<Category> {
  FormDropdownItemCategory(
    Category category,
    BuildContext context, {
    super.key,
  }) : super(value: category, child: _buildChild(category, context));

  static Widget _buildChild(Category category, BuildContext context) {
    return Row(
      children: [
        Icon(
          category.icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(category.name,
            style: TextStyle(
              color: Colors.grey[700]!,
            )),
      ],
    );
  }
}
