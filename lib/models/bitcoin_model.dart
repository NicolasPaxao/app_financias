// ignore_for_file: public_member_api_docs, sort_constructors_first
class BrokerageModel {
  String key;
  String name;
  double last;
  double buy;
  double sell;
  double variation;

  BrokerageModel({
    required this.key,
    required this.name,
    required this.last,
    required this.buy,
    required this.sell,
    required this.variation,
  });

  factory BrokerageModel.fromJson(Map<String, dynamic> map, String key) {
    return BrokerageModel(
      key: key,
      name: map['name'] as String,
      last: map['last'] == null ? 0.0 : map['last'] as double,
      buy: map['buy'] == null ? 0.0 : map['buy'] as double,
      sell: map['sell'] == null ? 0.0 : map['sell'] as double,
      variation: map['variation'] == null ? 0.0 : map['variation'] as double,
    );
  }

  @override
  String toString() {
    return 'BrokerageModel(name: $name, last: $last, buy: $buy, sell: $sell, variation: $variation)';
  }
}
