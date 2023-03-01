import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/finance_controller.dart';
import '../widgets/currency_tile.dart';
import '../widgets/section_title.dart';

class HomeInfoPage extends StatelessWidget {
  const HomeInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinanceController>(
      init: FinanceController(),
      builder: (controller) {
        return !controller.isLoading
            ? RefreshIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
                onRefresh: () => controller.getData(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(title: 'Moedas'),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.currencies.length,
                          itemBuilder: (context, index) {
                            final currency = controller.currencies[index];
                            return CurrencyTile(currency: currency);
                          },
                        ),
                        const SectionTitle(title: 'Corretoras'),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.stocks.length,
                          itemBuilder: (context, index) {
                            final stock = controller.stocks[index];
                            return ListTile(
                              title: Text('${stock.key} - ${stock.name}'),
                            );
                          },
                        ),
                        const SectionTitle(title: 'Bitcoin'),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.brokerages.length,
                          itemBuilder: (context, index) {
                            final brokerage = controller.brokerages[index];
                            return ListTile(
                              title:
                                  Text('${brokerage.key} - ${brokerage.name}'),
                            );
                          },
                        ),
                        const SectionTitle(title: 'Taxas Brasileiras'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.taxesModel!.date.toString(),
                              locale: const Locale('pt', 'BR'),
                            ),
                            Text(
                              controller.taxesModel!.cdi.toString(),
                              locale: const Locale('pt', 'BR'),
                            ),
                            Text(
                              controller.taxesModel!.selic.toString(),
                              locale: const Locale('pt', 'BR'),
                            ),
                            Text(
                              controller.taxesModel!.dailyFactor.toString(),
                              locale: const Locale('pt', 'BR'),
                            ),
                            Text(
                              controller.taxesModel!.selicDaily.toString(),
                              locale: const Locale('pt', 'BR'),
                            ),
                            Text(
                              controller.taxesModel!.cdiDaily.toString(),
                              locale: const Locale('pt', 'BR'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
      },
    );
  }
}
