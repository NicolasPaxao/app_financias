// ignore_for_file: public_member_api_docs, sort_constructors_first
class StockModel {
  String key;
  String name;
  String location;
  double points;
  double variation;

  StockModel({
    required this.key,
    required this.name,
    required this.location,
    required this.points,
    required this.variation,
  });

  factory StockModel.fromJson(Map<String, dynamic> map, String key) {
    return StockModel(
      key: key,
      name: map['name'] as String,
      location: map['location'] as String,
      points: map['points'] == null ? 0.0 : map['points'] as double,
      variation: map['variation'] == null ? 0.0 : map['variation'] as double,
    );
  }

  @override
  String toString() {
    return 'StockModel(name: $name, location: $location, points: $points, variation: $variation)';
  }
}
