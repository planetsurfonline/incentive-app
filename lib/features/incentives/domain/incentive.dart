import 'dart:convert';

class Incentive {
  final double amount;

  Incentive({
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
    };
  }

  factory Incentive.fromMap(Map<String, dynamic> map) {
    // TODO: Change key to API
    return Incentive(
      amount: (map["amount"] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Incentive.fromJson(String source) =>
      Incentive.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'amount: $amount)';
}
