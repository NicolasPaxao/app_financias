import 'package:cotacao_moedas_app/modules/home/bindings/finance_binding.dart';
import 'package:cotacao_moedas_app/modules/home/view/home_page.dart';
import 'package:get/get.dart';

abstract class PagesRoutes {
  static const String splashRoute = '/splash';
  static const String homeRoute = '/';
}

abstract class RoutesManager {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.homeRoute,
      page: () => const HomePage(),
      bindings: [
        FinanceBinding(),
      ],
    ),
  ];
}
