import 'dart:io';
import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/classes/category.dart';
import 'package:ads_app/components/app_title.dart';
import 'package:ads_app/components/form_button.dart';
import 'package:ads_app/components/form_dropdown.dart';
import 'package:ads_app/components/form_dropdown_item_category.dart';
import 'package:ads_app/components/form_input.dart';
import 'package:ads_app/mocks/category_mocks.dart';
import 'package:ads_app/mocks/user_mocks.dart';
import 'package:ads_app/utils/only_digits.dart';
import 'package:ads_app/utils/text_input_formatters/price_text_input_formatter.dart';
import 'package:ads_app/utils/text_input_validators/empty_form_drop_down_input_validator.dart';
import 'package:ads_app/utils/text_input_validators/not_empty_text_input_validator.dart';
import 'package:ads_app/utils/text_input_validators/prince_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdvertisementFormScreen extends StatefulWidget {
  final Advertisement? advertisement;

  const AdvertisementFormScreen({
    super.key,
    this.advertisement,
  });

  @override
  State<AdvertisementFormScreen> createState() =>
      _AdvertisementFormScreenState();
}

class _AdvertisementFormScreenState extends State<AdvertisementFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _advertisementNameController =
      TextEditingController();
  final TextEditingController _advertisementPriceController =
      TextEditingController();
  final TextEditingController _advertisementDescriptionController =
      TextEditingController();
  Category? _selectedCategory;
  File? _image;

  SizedBox defaultSpacer = const SizedBox(height: 10);

  String screenTitle = "Novo anúncio";
  String submitButtonTitle = "Cadastrar";
  Color? submitButtonColor;

  @override
  void initState() {
    super.initState();

    if (widget.advertisement == null) return;

    Advertisement advertisement = widget.advertisement!;

    screenTitle = 'Editar anúncio';
    submitButtonTitle = "Salvar";
    submitButtonColor = Colors.blue;

    _selectedCategory = advertisement.category;
    _advertisementNameController.text = advertisement.name;
    _advertisementPriceController.text = advertisement.formattedPrice;
    if (advertisement.description != null) {
      _advertisementDescriptionController.text = advertisement.description!;
    }
    _image = advertisement.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const AppTitle(),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Text(
                  screenTitle,
                  style: TextStyle(
                    color: Colors.grey[600]!,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              defaultSpacer,
              GestureDetector(
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
                    child: _image == null
                        ? const Icon(Icons.add_a_photo, size: 25)
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
                onTap: () async {
                  final ImagePicker imagePicker = ImagePicker();
                  final XFile? pickedFile =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
              ),
              defaultSpacer,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormInput(
                      controller: _advertisementNameController,
                      hintText: 'Nome',
                      validators: [notEmptyTextInputValidator],
                    ),
                    defaultSpacer,
                    FormInput(
                      controller: _advertisementPriceController,
                      hintText: 'Preço',
                      keyboardType: TextInputType.number,
                      textFormatters: [PriceInputFormatter()],
                      validators: [priceInputValidator],
                    ),
                    defaultSpacer,
                    FormInput(
                      controller: _advertisementDescriptionController,
                      hintText: 'Descrição',
                      maxlines: 3,
                    ),
                    defaultSpacer,
                    FormDropdown<Category>(
                      hint: "Selecione uma categoria",
                      selectedItem: _selectedCategory,
                      items: categories,
                      onChanged: (category) {
                        _selectedCategory = category;
                      },
                      itemBuilder: (category) =>
                          FormDropdownItemCategory(category, context),
                      validators: [emptyFormDropDownInputValidator],
                    ),
                  ],
                ),
              ),
              defaultSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FormButton(
                    text: "Cancelar",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                  ),
                  FormButton(
                    text: submitButtonTitle,
                    color: submitButtonColor,
                    onPressed: () {
                      if (_formKey.currentState == null) return;
                      bool isValidated = _formKey.currentState!.validate();
                      if (isValidated == false) return;

                      String name = _advertisementNameController.text.trim();
                      String stringPrice =
                          _advertisementPriceController.text.trim();
                      int priceInCents = int.parse(onlyDigits(stringPrice));
                      String? description =
                          _advertisementDescriptionController.text.trim();

                      // TODO: remove hardcoded user on future
                      if (widget.advertisement != null) {
                        widget.advertisement!.name = name;
                        widget.advertisement!.priceInCents = priceInCents;
                        widget.advertisement!.category = _selectedCategory!;
                        widget.advertisement!.description = description;
                        widget.advertisement!.image = _image;

                        Navigator.pop(context);
                      } else {
                        Advertisement advertisement = Advertisement.create(
                          name: name,
                          priceInCents: priceInCents,
                          category: _selectedCategory!,
                          image: _image,
                          description: description,
                          advertiser: userHigor,
                        );

                        Navigator.pop(context, advertisement);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
