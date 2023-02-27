import 'package:cotacao_moedas_app/models/bitcoin_model.dart';
import 'package:cotacao_moedas_app/models/currency_model.dart';
import 'package:cotacao_moedas_app/models/stock_model.dart';
import 'package:cotacao_moedas_app/models/taxes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../utils/http_manager.dart';

class FinanceController extends GetxController {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  List<CurrencyModel> currencies = [];
  List<StockModel> stocks = [];
  List<BrokerageModel> brokerages = [];
  TaxesModel? taxesModel;
  Map<String, dynamic> results = {};

  @override
  void onInit() {
    super.onInit();
    _getData();
  }

  Future<void> _getData() async {
    if (results.isEmpty) {
      setLoading(true);
      HttpManager httpManager = HttpManager();
      final result = await httpManager.request(
        url: "$apiUrl/finance?key=${dotenv.get('API_KEY')}",
        method: "GET",
      );
      results = result as Map<String, dynamic>;
      _separeteData();
      setLoading(false);
    }
  }

  void _separeteData() {
    if (results.isEmpty) return;

    Map<String, dynamic> currenciesMap = results['currencies'];
    currenciesMap.remove("source");
    Map<String, dynamic> stocksMap = results['stocks'];
    Map<String, dynamic> bitcoinMap = results['bitcoin'];
    Map<String, dynamic> taxesMap = results['taxes'][0];

    currenciesMap
        .forEach((key, map) => currencies.add(CurrencyModel.fromJson(map)));
    stocksMap.forEach((key, map) => stocks.add(StockModel.fromJson(map)));
    bitcoinMap
        .forEach((key, map) => brokerages.add(BrokerageModel.fromJson(map)));
    taxesModel = TaxesModel.fromJson(taxesMap);

    debugPrint("Sucesso na execuão!");
  }
}