import 'package:ads_app/db/database_service.dart';
import 'package:ads_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseService().initDb(seed: true);

  runApp(MaterialApp(
    title: 'P.O.N.T.O — Plataforma Online de Negócios, Trocas e Ofertas',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFF4B01),
        primary: const Color(0xFFFF4B01),
      ),
      useMaterial3: true,
    ),
    home: const HomeScreen(),
  ));
}
