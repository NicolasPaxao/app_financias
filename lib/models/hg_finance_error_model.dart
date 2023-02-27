// ignore_for_file: public_member_api_docs, sort_constructors_first
class HgFinanceErrorModel {
  String error;
  String message;

  HgFinanceErrorModel({
    required this.error,
    required this.message,
  });

  factory HgFinanceErrorModel.fromJson(Map<String, dynamic> map) {
    return HgFinanceErrorModel(
      error: map['error'] as String,
      message: map['message'] as String,
    );
  }

  @override
  String toString() => 'HgFinanceErrorModel(error: $error, message: $message)';
}
