import 'package:ads_app/classes/advertisement.dart';
import 'package:flutter/material.dart';

class DeleteAdvertisementConfirmationDialog extends StatelessWidget {
  final Advertisement advertisement;
  final VoidCallback onConfirm;

  const DeleteAdvertisementConfirmationDialog({
    super.key,
    required this.advertisement,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Excluir ${advertisement.name}'),
      content: const Text('Tem certeza que deseja apagar este anúncio?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(true);
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
