import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final Color textColor;
  final Color? color;
  final String text;
  final VoidCallback onPressed;

  const FormButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
        ),
      ),
    );
  }
}
