import 'package:cotacao_moedas_app/utils/dependency_injection.dart';
import 'package:cotacao_moedas_app/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Cotação de moedas',
      initialRoute: PagesRoutes.homeRoute,
      getPages: RoutesManager.pages,
    );
  }
}
