// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:psm_incentive/utils/formatter/date_formatter.dart';

class Period {
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  String get label {
    return '$name (${DateFormatter.getCustomDateFormat('dd MMM', startDate)} - ${DateFormatter.getCustomDateFormat('dd MMM yyyy', endDate)})';
  }

  const Period({
    required this.name,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
    };
  }

  factory Period.fromMap(Map<String, dynamic> map) {
    return Period(
      name: (map["name"] ?? '') as String,
      startDate:
          DateTime.fromMillisecondsSinceEpoch((map["startDate"] ?? 0) as int),
      endDate:
          DateTime.fromMillisecondsSinceEpoch((map["endDate"] ?? 0) as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Period.fromJson(String source) =>
      Period.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Period(name: $name, startDate: $startDate, endDate: $endDate)';

  @override
  bool operator ==(covariant Period other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode => name.hashCode ^ startDate.hashCode ^ endDate.hashCode;
}
