import 'package:ads_app/classes/advertisement.dart';
import 'package:flutter/material.dart';

class AdvertisementCard extends StatelessWidget {
  final Advertisement _advertisement;
  final WidgetBuilder? _extraContentBuilder;

  const AdvertisementCard(
    this._advertisement, {
    super.key,
    WidgetBuilder? extraContentBuilder,
  }) : _extraContentBuilder = extraContentBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Icon(
          _advertisement.category.icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(_advertisement.name),
        subtitle: Text(
          _advertisement.description ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
              child: Text(
                _advertisement.formattedPrice,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (_extraContentBuilder != null) _extraContentBuilder(context),
          ],
        ),
      ),
    );
  }
}
