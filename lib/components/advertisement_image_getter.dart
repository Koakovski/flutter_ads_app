import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef AdvertisementImageGetterOnGetImage = void Function(File?);

class AdvertisementImageGetter extends StatelessWidget {
  final File? image;
  final AdvertisementImageGetterOnGetImage onGetImage;

  const AdvertisementImageGetter({
    super.key,
    this.image,
    required this.onGetImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey[400]!,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: image == null
              ? const Icon(Icons.add_a_photo, size: 25)
              : Image.file(image!, fit: BoxFit.cover),
        ),
      ),
      onLongPress: () {
        onGetImage(null);
      },
      onTap: () async {
        final ImagePicker imagePicker = ImagePicker();
        final XFile? pickedFile =
            await imagePicker.pickImage(source: ImageSource.gallery);

        final File? image = pickedFile != null ? File(pickedFile.path) : null;

        onGetImage(image);
      },
    );
  }
}
