// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';
import 'package:psm_incentive/features/store/domain/models.dart';

class Member {
  final String fullname;
  final JobRole jobRole;
  final Store store;
  final Incentive incentive;

  const Member({
    required this.fullname,
    required this.jobRole,
    required this.store,
    required this.incentive,
  });

  String get nameInitials {
    List<String> names = fullname.trim().split(' ');

    if (names.length > 1) {
      String initials = names.first[0] + names.last[0];
      return initials.toUpperCase();
    } else if (names.isNotEmpty) {
      return names.first[0].toUpperCase();
    } else {
      return '';
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'jobRole': jobRole.toMap(),
      'store': store.toMap(),
      'incentive': incentive.toMap(),
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      fullname: (map["fullname"] ?? '') as String,
      jobRole: JobRole.fromMap((map["job_role"] ??
          Map<String, dynamic>.from({})) as Map<String, dynamic>),
      store: Store.fromMap((map["store"] ?? Map<String, dynamic>.from({}))
          as Map<String, dynamic>),
      incentive: Incentive.fromMap((map["incentive"] ??
          Map<String, dynamic>.from({})) as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) =>
      Member.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Member(fullname: $fullname, jobRole: $jobRole, store: $store, incentive: $incentive)';
  }

  @override
  bool operator ==(covariant Member other) {
    if (identical(this, other)) return true;

    return other.fullname == fullname &&
        other.jobRole == jobRole &&
        other.store == store &&
        other.incentive == incentive;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^
        jobRole.hashCode ^
        store.hashCode ^
        incentive.hashCode;
  }
}
