// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.borderColor,
    required this.invertedProgressColor,
    required this.iconBackgroundColor,
  });
  final Color? borderColor;
  final Color? invertedProgressColor;
  final Color? iconBackgroundColor;

  @override
  CustomColors copyWith({
    Color? borderColor,
    Color? invertedProgressColor,
    Color? iconBackgroundColor,
  }) {
    return CustomColors(
      borderColor: borderColor ?? this.borderColor,
      invertedProgressColor:
          invertedProgressColor ?? this.invertedProgressColor,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
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
      iconBackgroundColor:
          Color.lerp(iconBackgroundColor, other.iconBackgroundColor, t),
    );
  }

  // the light theme
  static const light = CustomColors(
    borderColor: Color(0xFFE9ECEF),
    invertedProgressColor: Colors.black,
    iconBackgroundColor: Color(0xFFE9ECEF),
  );

  // the dark theme
  static const dark = CustomColors(
    borderColor: Color(0xFF495057),
    invertedProgressColor: Colors.white,
    iconBackgroundColor: Color(0xFF495057),
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'borderColor': borderColor?.value,
      'invertedProgressColor': invertedProgressColor?.value,
      'iconBackgroundColor': iconBackgroundColor?.value,
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
      iconBackgroundColor: map['iconBackgroundColor'] != null
          ? Color((map["iconBackgroundColor"] ?? 0) ?? 0xffffff)
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
        other.iconBackgroundColor == iconBackgroundColor;
  }

  @override
  int get hashCode {
    return borderColor.hashCode ^
        invertedProgressColor.hashCode ^
        iconBackgroundColor.hashCode;
  }
}
