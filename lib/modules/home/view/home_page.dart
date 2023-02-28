import 'package:cotacao_moedas_app/models/currency_model.dart';
import 'package:cotacao_moedas_app/modules/home/controller/finance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text(
            'HG Finance',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 300,
            ),
            reverseDuration: const Duration(
              milliseconds: 300,
            ),
            child: pageIndex == 0
                ? const Icon(
                    Icons.monetization_on,
                    size: 36,
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        pageIndex = 0;
                        controller.animateToPage(pageIndex,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut);
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                  ),
          ),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                  controller.animateToPage(pageIndex,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut);
                });
              },
              icon: const Icon(
                Icons.swap_horiz,
              ),
              label: const Text(
                'Converter',
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, pageIndex == 0 ? 45 : 0),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              reverseDuration: const Duration(milliseconds: 250),
              firstChild: pageIndex == 0
                  ? TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.white,
                      controller: tabController,
                      tabs: const [
                        Tab(text: 'Moedas'),
                        Tab(text: 'Corretoras'),
                        Tab(text: 'Bitcoin'),
                        Tab(text: 'Taxas'),
                      ],
                    )
                  : const SizedBox(),
              crossFadeState: pageIndex == 0
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              secondChild: const SizedBox(),
            ),
          )),
      body: PageView(
        controller: controller,
        children: [
          const HomeInfoPage(),
          Column(
            children: const [
              Text('data'),
            ],
          )
        ],
      ),
    );
  }
}

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
            ? SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Moedas',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const Divider(thickness: 1, height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.currencies.length,
                        itemBuilder: (context, index) {
                          final currency = controller.currencies[index];
                          return CurrencyTile(currency: currency);
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
                            title: Text('${brokerage.key} - ${brokerage.name}'),
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
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
      },
    );
  }
}

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({
    super.key,
    required this.currency,
  });

  final CurrencyModel currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 73, 73, 73),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          textColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: Text(
              currency.key,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            currency.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: currency.sell == 0.0
              ? null
              : Text(
                  'Sell: R\$ ${currency.sell.toStringAsFixed(2).replaceAll('.', ',')}',
                ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${currency.buy.toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.graphic_eq_outlined,
                    color: currency.variation < 0
                        ? Colors.redAccent
                        : Colors.greenAccent,
                    shadows: const [
                      Shadow(
                        color: Colors.white12,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  Text(
                    ' ${(currency.variation).toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: currency.variation < 0
                            ? Colors.redAccent
                            : Colors.greenAccent),
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
