import 'dart:convert';

class HistoryItem {
  final String invoiceNumber;
  final DateTime invoiceDate;
  final double incentiveAmount;

  HistoryItem({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.incentiveAmount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceNumber': invoiceNumber,
      'invoiceDate': invoiceDate.millisecondsSinceEpoch,
      'incentiveAmount': incentiveAmount,
    };
  }

  factory HistoryItem.fromMap(Map<String, dynamic> map) {
    // TODO: Change key to API
    return HistoryItem(
      invoiceNumber: (map["invoiceNumber"] ?? '') as String,
      invoiceDate:
          DateTime.fromMillisecondsSinceEpoch((map["invoiceDate"] ?? 0) as int),
      incentiveAmount: (map["incentiveAmount"] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryItem.fromJson(String source) =>
      HistoryItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HistoryItem(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, incentiveAmount: $incentiveAmount)';
}
