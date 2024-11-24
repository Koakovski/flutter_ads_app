import 'package:ads_app/classes/advertisement.dart';
import 'package:flutter/material.dart';

class AdvertisementCardLeading extends StatelessWidget {
  final Advertisement _advertisement;
  final double size = 50.0;

  const AdvertisementCardLeading(
    this._advertisement, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: _advertisement.image == null
            ? Theme.of(context).colorScheme.primary
            : null,
        borderRadius: BorderRadius.circular(10),
        image: _advertisement.image != null
            ? DecorationImage(
                image: FileImage(_advertisement.image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: _advertisement.image == null
          ? Icon(
              _advertisement.category.icon,
              color: Colors.white,
              size: size * 0.5,
            )
          : null,
    );
  }
}
