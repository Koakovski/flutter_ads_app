import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/components/advertisement_card.dart';
import 'package:ads_app/components/app_title.dart';
import 'package:ads_app/components/delete_advertisement_confirmation_dialog.dart';
import 'package:ads_app/screens/advertisement_form_screen.dart';
import 'package:ads_app/mocks/advertisements_mocks.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Advertisement> _advertisements = initialAdvertisements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const AppTitle(),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            onPressed: () async {
              Advertisement? advertisement = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdvertisementFormScreen(),
                ),
              );

              if (advertisement != null) {
                setState(() {
                  _advertisements.insert(0, advertisement);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _advertisements.length,
          itemBuilder: (context, position) {
            Advertisement advertisement = _advertisements[position];

            return Dismissible(
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              key: ValueKey(advertisement.id),
              child: GestureDetector(
                onLongPress: () async {
                  final Uri url = Uri(
                    scheme: 'whatsapp',
                    host: 'send',
                    queryParameters: {
                      'text': "ola",
                    },
                  );

                  if (!(await canLaunchUrl(url))) return;

                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: AdvertisementCard(
                  advertisement,
                  extraContentBuilder: (context) {
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdvertisementFormScreen(
                              advertisement: advertisement,
                            ),
                          ),
                        );

                        setState(() {});
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 15,
                      ),
                    );
                  },
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteAdvertisementConfirmationDialog(
                      advertisement: advertisement,
                      onConfirm: () {
                        setState(() {
                          _advertisements.removeAt(position);
                        });
                      },
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
