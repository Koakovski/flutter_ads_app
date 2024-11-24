import 'package:ads_app/classes/category.dart';
import 'package:flutter/material.dart';

Category categoryBook = Category.create(
  name: "Livros",
  icon: Icons.book,
);

Category categoryElectronics = Category.create(
  name: "Eletronicos",
  icon: Icons.electrical_services,
);

Category categoryClothing = Category.create(
  name: "Roupas",
  icon: Icons.checkroom,
);

Category categoryHome = Category.create(
  name: "Casa",
  icon: Icons.home,
);

Category categorySports = Category.create(
  name: "Esportes",
  icon: Icons.sports_volleyball,
);

Category categoryToys = Category.create(
  name: "Brinquedos",
  icon: Icons.toys,
);

Category categoryFood = Category.create(
  name: "Comida",
  icon: Icons.fastfood,
);

Category categoryBeauty = Category.create(
  name: "Beleza",
  icon: Icons.face,
);

Category categoryHealth = Category.create(
  name: "Saúde",
  icon: Icons.local_hospital,
);

Category categoryAutomotive = Category.create(
  name: "Automotivo",
  icon: Icons.directions_car,
);

final List<Category> categoriesMock = [
  categoryBook,
  categoryElectronics,
  categoryClothing,
  categoryHome,
  categorySports,
  categoryToys,
  categoryFood,
  categoryBeauty,
  categoryHealth,
  categoryAutomotive,
];
