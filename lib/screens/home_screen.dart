import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/components/advertisement_card.dart';
import 'package:ads_app/components/app_title.dart';
import 'package:ads_app/components/delete_advertisement_confirmation_dialog.dart';
import 'package:ads_app/components/show_advertisement_share_sheet.dart';
import 'package:ads_app/db/repositories/advertisement_repository.dart';
import 'package:ads_app/screens/advertisement_form_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AdvertisementRepository _advertisementRepository =
      AdvertisementRepository();
  List<Advertisement> _advertisements = [];

  @override
  void initState() {
    super.initState();
    _loadAdvertisements();
  }

  Future<void> _loadAdvertisements() async {
    final advertisements = await _advertisementRepository.findAll();
    setState(() {
      _advertisements = advertisements;
    });
  }

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
                await _advertisementRepository.create(advertisement);
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
              child: AdvertisementCard(
                advertisement,
                extraContentBuilder: (context) {
                  return SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdvertisementFormScreen(
                                  advertisement: advertisement,
                                ),
                              ),
                            );

                            await _advertisementRepository
                                .update(advertisement);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            showAdvertisementShareSheet(
                              context,
                              advertisement: advertisement,
                            );
                          },
                          child: const Icon(
                            Icons.share,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
