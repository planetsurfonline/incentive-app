// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:psm_incentive/features/incentives/domain/models.dart';

class IncentiveData extends Incentive {
  final String invoiceNumber;
  final DateTime invoiceDate;

  IncentiveData({
    required this.invoiceNumber,
    required this.invoiceDate,
    required super.amount,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceNumber': invoiceNumber,
      'invoiceDate': invoiceDate.millisecondsSinceEpoch,
      ...super.toMap()
    };
  }

  factory IncentiveData.fromMap(Map<String, dynamic> map) {
    return IncentiveData(
      invoiceNumber: (map["invoiceNumber"] ?? '') as String,
      invoiceDate:
          DateTime.fromMillisecondsSinceEpoch((map["invoiceDate"] ?? 0) as int),
      amount: (map["incentive_amount"] ?? '') as double,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory IncentiveData.fromJson(String source) =>
      IncentiveData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IncentiveData(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, amount: ${super.amount})';

  @override
  bool operator ==(covariant IncentiveData other) {
    if (identical(this, other)) return true;

    return other.invoiceNumber == invoiceNumber &&
        other.invoiceDate == invoiceDate;
  }

  @override
  int get hashCode =>
      invoiceNumber.hashCode ^ invoiceDate.hashCode ^ super.hashCode;
}
