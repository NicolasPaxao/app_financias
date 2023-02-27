// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrencyModel {
  String name;
  double buy;
  double sell;
  double variation;

  CurrencyModel({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> map) {
    return CurrencyModel(
      name: map['name'] as String,
      buy: map['buy'] == null ? 0.0 : map['buy'] as double,
      sell: map['sell'] == null ? 0.0 : map['sell'] as double,
      variation: map['variation'] == null ? 0.0 : map['variation'] as double,
    );
  }

  @override
  String toString() {
    return 'CurrencyModel(name: $name, buy: $buy, sell: $sell, variation: $variation)';
  }
}
