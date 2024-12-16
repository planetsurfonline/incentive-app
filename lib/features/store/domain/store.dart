// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:psm_incentive/features/filter/domain/models.dart';

class Store implements Filter {
  final String storeName;
  final String storeUuid;
  const Store({
    required this.storeName,
    required this.storeUuid,
  });

  @override
  String get label => storeName;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'storeName': storeName,
      'storeUuid': storeUuid,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      storeName: (map["storeName"] ?? '') as String,
      storeUuid: (map["storeUuid"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) =>
      Store.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Store(storeName: $storeName, storeUuid: $storeUuid)';

  @override
  bool operator ==(covariant Store other) {
    if (identical(this, other)) return true;

    return other.storeName == storeName && other.storeUuid == storeUuid;
  }

  @override
  int get hashCode => storeName.hashCode ^ storeUuid.hashCode;
}
