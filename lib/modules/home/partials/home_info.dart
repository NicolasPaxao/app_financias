import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/finance_controller.dart';
import '../widgets/bitcoin_tile.dart';
import '../widgets/currency_tile.dart';
import '../widgets/section_title.dart';
import '../widgets/stock_tile.dart';

class HomeInfoPage extends StatelessWidget {
  const HomeInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinanceController>(
      init: FinanceController(),
      builder: (controller) {
        var format = DateFormat('dd/MM/yyyy');
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
                            return StockTile(
                              stock: stock,
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
                            return BitcoinTile(
                              bitcoin: brokerage,
                            );
                          },
                        ),
                        const SectionTitle(title: 'Taxas Brasileiras'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Última atualização: ${format.format(controller.taxesModel!.date)}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'CDI: ${controller.taxesModel!.cdi.toString()}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'SELIC: ${controller.taxesModel!.selic.toString()}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Fator diário: ${controller.taxesModel!.dailyFactor.toStringAsFixed(2)}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'SELIC diário: ${controller.taxesModel!.selicDaily.toString()}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'CDI diário: ${controller.taxesModel!.cdiDaily.toString()}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
