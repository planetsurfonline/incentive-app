// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.borderColor,
    required this.invertedProgressColor,
    required this.tableHeaderColor,
    required this.tableBorderColor,
    required this.matchedCountBackgroundColor,
    required this.matchedCountTextColor,
    required this.minusCountBackgroundColor,
    required this.minusCountTextColor,
    required this.surplusCountBackgroundColor,
    required this.surplusCountTextColor,
    required this.filterCountBackgroundColor,
  });
  final Color? borderColor;
  final Color? invertedProgressColor;
  final Color? tableHeaderColor;
  final Color? tableBorderColor;
  final Color? matchedCountBackgroundColor;
  final Color? matchedCountTextColor;
  final Color? minusCountBackgroundColor;
  final Color? minusCountTextColor;
  final Color? surplusCountBackgroundColor;
  final Color? surplusCountTextColor;
  final Color? filterCountBackgroundColor;

  @override
  CustomColors copyWith({
    Color? borderColor,
    Color? invertedProgressColor,
    Color? tableHeaderColor,
    Color? tableBorderColor,
    Color? matchedCountBackgroundColor,
    Color? matchedCountTextColor,
    Color? minusCountBackgroundColor,
    Color? minusCountTextColor,
    Color? surplusCountBackgroundColor,
    Color? surplusCountTextColor,
    Color? filterCountBackgroundColor,
  }) {
    return CustomColors(
      borderColor: borderColor ?? this.borderColor,
      invertedProgressColor:
          invertedProgressColor ?? this.invertedProgressColor,
      tableHeaderColor: tableHeaderColor ?? this.tableHeaderColor,
      tableBorderColor: tableBorderColor ?? this.tableBorderColor,
      matchedCountBackgroundColor:
          matchedCountBackgroundColor ?? this.matchedCountBackgroundColor,
      matchedCountTextColor:
          matchedCountTextColor ?? this.matchedCountTextColor,
      minusCountBackgroundColor:
          minusCountBackgroundColor ?? this.minusCountBackgroundColor,
      minusCountTextColor: minusCountTextColor ?? this.minusCountTextColor,
      surplusCountBackgroundColor:
          surplusCountBackgroundColor ?? this.surplusCountBackgroundColor,
      surplusCountTextColor:
          surplusCountTextColor ?? this.surplusCountTextColor,
      filterCountBackgroundColor:
          filterCountBackgroundColor ?? this.filterCountBackgroundColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      invertedProgressColor:
          Color.lerp(invertedProgressColor, other.invertedProgressColor, t),
      tableHeaderColor: Color.lerp(tableHeaderColor, other.tableHeaderColor, t),
      tableBorderColor: Color.lerp(tableBorderColor, other.tableBorderColor, t),
      matchedCountBackgroundColor: Color.lerp(
          matchedCountBackgroundColor, other.matchedCountBackgroundColor, t),
      matchedCountTextColor:
          Color.lerp(matchedCountTextColor, other.matchedCountTextColor, t),
      minusCountBackgroundColor: Color.lerp(
          minusCountBackgroundColor, other.minusCountBackgroundColor, t),
      minusCountTextColor:
          Color.lerp(minusCountTextColor, other.minusCountTextColor, t),
      surplusCountBackgroundColor: Color.lerp(
          surplusCountBackgroundColor, other.surplusCountBackgroundColor, t),
      surplusCountTextColor:
          Color.lerp(surplusCountTextColor, other.surplusCountTextColor, t),
      filterCountBackgroundColor: Color.lerp(
          filterCountBackgroundColor, other.filterCountBackgroundColor, t),
    );
  }

  // the light theme
  static final light = CustomColors(
    borderColor: const Color(0xFFE9ECEF),
    invertedProgressColor: Colors.black,
    tableHeaderColor: const Color(0xffF5F8FB),
    tableBorderColor: const Color(0xFFE9ECEF),
    matchedCountBackgroundColor: Colors.green.shade50,
    matchedCountTextColor: Colors.green.shade800,
    minusCountBackgroundColor: Colors.red.shade50,
    minusCountTextColor: Colors.red.shade800,
    surplusCountBackgroundColor: Colors.blue.shade50,
    surplusCountTextColor: Colors.blue.shade800,
    filterCountBackgroundColor: Colors.black,
  );

  // the dark theme
  static const dark = CustomColors(
    borderColor: Color(0xFF495057),
    invertedProgressColor: Colors.white,
    tableHeaderColor: Color(0xFF1A1D20),
    tableBorderColor: Color(0xFF1A1D20),
    matchedCountBackgroundColor: Color(0x19B2F2BB),
    matchedCountTextColor: Color(0xffB2F2BB),
    minusCountBackgroundColor: Color(0x33C92A2A),
    minusCountTextColor: Color(0xFFF4D4D4),
    surplusCountBackgroundColor: Color(0x193A3EE2),
    surplusCountTextColor: Color(0xFFBAC8FF),
    filterCountBackgroundColor: Colors.white,
  );

  @override
  String toString() {
    return 'CustomColors(borderColor: $borderColor, invertedProgressColor: $invertedProgressColor, tableHeaderColor: $tableHeaderColor, tableBorderColor: $tableBorderColor, matchedCountBackgroundColor: $matchedCountBackgroundColor, matchedCountTextColor: $matchedCountTextColor, minusCountBackgroundColor: $minusCountBackgroundColor, minusCountTextColor: $minusCountTextColor, surplusCountBackgroundColor: $surplusCountBackgroundColor, surplusCountTextColor: $surplusCountTextColor, filterCountBackgroundColor: $filterCountBackgroundColor)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'borderColor': borderColor?.value,
      'invertedProgressColor': invertedProgressColor?.value,
      'tableHeaderColor': tableHeaderColor?.value,
      'tableBorderColor': tableBorderColor?.value,
      'matchedCountBackgroundColor': matchedCountBackgroundColor?.value,
      'matchedCountTextColor': matchedCountTextColor?.value,
      'minusCountBackgroundColor': minusCountBackgroundColor?.value,
      'minusCountTextColor': minusCountTextColor?.value,
      'surplusCountBackgroundColor': surplusCountBackgroundColor?.value,
      'surplusCountTextColor': surplusCountTextColor?.value,
      'filterCountBackgroundColor': filterCountBackgroundColor?.value,
    };
  }

  factory CustomColors.fromMap(Map<String, dynamic> map) {
    return CustomColors(
      borderColor: map['borderColor'] != null
          ? Color((map["borderColor"] ?? 0) ?? 0xffffff)
          : null,
      invertedProgressColor: map['invertedProgressColor'] != null
          ? Color((map["invertedProgressColor"] ?? 0) ?? 0xffffff)
          : null,
      tableHeaderColor: map['tableHeaderColor'] != null
          ? Color((map["tableHeaderColor"] ?? 0) ?? 0xffffff)
          : null,
      tableBorderColor: map['tableBorderColor'] != null
          ? Color((map["tableBorderColor"] ?? 0) ?? 0xffffff)
          : null,
      matchedCountBackgroundColor: map['matchedCountBackgroundColor'] != null
          ? Color((map["matchedCountBackgroundColor"] ?? 0) ?? 0xffffff)
          : null,
      matchedCountTextColor: map['matchedCountTextColor'] != null
          ? Color((map["matchedCountTextColor"] ?? 0) ?? 0xffffff)
          : null,
      minusCountBackgroundColor: map['minusCountBackgroundColor'] != null
          ? Color((map["minusCountBackgroundColor"] ?? 0) ?? 0xffffff)
          : null,
      minusCountTextColor: map['minusCountTextColor'] != null
          ? Color((map["minusCountTextColor"] ?? 0) ?? 0xffffff)
          : null,
      surplusCountBackgroundColor: map['surplusCountBackgroundColor'] != null
          ? Color((map["surplusCountBackgroundColor"] ?? 0) ?? 0xffffff)
          : null,
      surplusCountTextColor: map['surplusCountTextColor'] != null
          ? Color((map["surplusCountTextColor"] ?? 0) ?? 0xffffff)
          : null,
      filterCountBackgroundColor: map['filterCountBackgroundColor'] != null
          ? Color((map["filterCountBackgroundColor"] ?? 0) ?? 0xffffff)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomColors.fromJson(String source) =>
      CustomColors.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CustomColors other) {
    if (identical(this, other)) return true;

    return other.borderColor == borderColor &&
        other.invertedProgressColor == invertedProgressColor &&
        other.tableHeaderColor == tableHeaderColor &&
        other.tableBorderColor == tableBorderColor &&
        other.matchedCountBackgroundColor == matchedCountBackgroundColor &&
        other.matchedCountTextColor == matchedCountTextColor &&
        other.minusCountBackgroundColor == minusCountBackgroundColor &&
        other.minusCountTextColor == minusCountTextColor &&
        other.surplusCountBackgroundColor == surplusCountBackgroundColor &&
        other.surplusCountTextColor == surplusCountTextColor &&
        other.filterCountBackgroundColor == filterCountBackgroundColor;
  }

  @override
  int get hashCode {
    return borderColor.hashCode ^
        invertedProgressColor.hashCode ^
        tableHeaderColor.hashCode ^
        tableBorderColor.hashCode ^
        matchedCountBackgroundColor.hashCode ^
        matchedCountTextColor.hashCode ^
        minusCountBackgroundColor.hashCode ^
        minusCountTextColor.hashCode ^
        surplusCountBackgroundColor.hashCode ^
        surplusCountTextColor.hashCode ^
        filterCountBackgroundColor.hashCode;
  }
}
