import 'package:cotacao_moedas_app/modules/home/controller/finance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<FinanceController>(
        init: FinanceController(),
        builder: (controller) {
          return !controller.isLoading
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.currencies.length,
                          itemBuilder: (context, index) {
                            final currency = controller.currencies[index];
                            return ListTile(
                              title: Text('${currency.key} - ${currency.name}'),
                            );
                          },
                        ),
                        const Divider(thickness: 1, height: 10),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.stocks.length,
                          itemBuilder: (context, index) {
                            final stock = controller.stocks[index];
                            return ListTile(
                              title: Text('${stock.key} - ${stock.name}'),
                            );
                          },
                        ),
                        const Divider(thickness: 1, height: 10),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                        const Divider(thickness: 1, height: 10),
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
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
