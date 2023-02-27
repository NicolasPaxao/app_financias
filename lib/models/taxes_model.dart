// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaxesModel {
  DateTime date;
  double cdi;
  double selic;
  double dailyFactor;
  double selicDaily;
  double cdiDaily;

  TaxesModel({
    required this.date,
    required this.cdi,
    required this.selic,
    required this.dailyFactor,
    required this.selicDaily,
    required this.cdiDaily,
  });

  factory TaxesModel.fromJson(Map<String, dynamic> map) {
    return TaxesModel(
      date: DateTime.parse(map['date'] as String),
      cdi: map['cdi'] as double,
      selic: map['selic'] as double,
      dailyFactor: map['daily_factor'] as double,
      selicDaily: map['selic_daily'] as double,
      cdiDaily: map['cdi_daily'] as double,
    );
  }

  @override
  String toString() {
    return 'TaxesModel(date: $date, cdi: $cdi, selic: $selic, dailyFactor: $dailyFactor, selicDaily: $selicDaily, cdiDaily: $cdiDaily)';
  }
}
