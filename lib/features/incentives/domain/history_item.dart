import 'dart:convert';

class Incentive {
  final String invoiceNumber;
  final DateTime invoiceDate;
  final double amount;

  Incentive({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceNumber': invoiceNumber,
      'invoiceDate': invoiceDate.millisecondsSinceEpoch,
      'amount': amount,
    };
  }

  factory Incentive.fromMap(Map<String, dynamic> map) {
    // TODO: Change key to API
    return Incentive(
      invoiceNumber: (map["invoiceNumber"] ?? '') as String,
      invoiceDate:
          DateTime.fromMillisecondsSinceEpoch((map["invoiceDate"] ?? 0) as int),
      amount: (map["amount"] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Incentive.fromJson(String source) =>
      Incentive.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Incentive(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, amount: $amount)';
}
