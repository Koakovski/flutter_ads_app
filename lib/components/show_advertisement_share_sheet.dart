import 'package:ads_app/classes/advertisement.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showAdvertisementShareSheet(
  BuildContext context, {
  required Advertisement advertisement,
}) {
  Future<void> sendUrl(Uri url) async {
    if (!(await canLaunchUrl(url))) return;

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  ListTile listTile(
      {required IconData icon, required String title, required Uri url}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        sendUrl(url);
        Navigator.pop(context);
      },
    );
  }

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Compartilhar "${advertisement.name}"',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              listTile(
                icon: Icons.phone,
                title: 'Compartilhar por Whatsapp',
                url: Uri(
                  scheme: 'whatsapp',
                  host: 'send',
                  queryParameters: {
                    'text':
                        "Oferta de ${advertisement.name} por ${advertisement.formattedPrice}",
                  },
                ),
              ),
              const Divider(),
              listTile(
                icon: Icons.email,
                title: 'Compartilhar por E-mail',
                url: Uri(
                  scheme: 'mailto',
                  path: '',
                  queryParameters: {
                    'subject': 'Oferta de ${advertisement.name}',
                    'body':
                        "Confira essa oferta: ${advertisement.name} por ${advertisement.formattedPrice}",
                  },
                ),
              ),
              const Divider(),
              listTile(
                icon: Icons.sms,
                title: 'Compartilhar por SMS',
                url: Uri(
                  scheme: 'sms',
                  path: '',
                  queryParameters: {
                    'body':
                        "Oferta de ${advertisement.name} por ${advertisement.formattedPrice}",
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
