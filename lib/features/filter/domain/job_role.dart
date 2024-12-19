// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:psm_incentive/features/filter/domain/models.dart';

enum JobRoleEnum {
  sales,
  cashier,
  inventory,
  storeHead,
  seniorStoreHead,
  areaManager;

  static JobRoleEnum fromMap(Map<String, dynamic> map) {
    switch (map['job_role']) {
      case 'sales':
        return JobRoleEnum.sales;
      case 'cashier':
        return JobRoleEnum.cashier;
      case 'inventory':
        return JobRoleEnum.inventory;
      case 'senior_store_head':
        return JobRoleEnum.seniorStoreHead;
      case 'area_manager':
        return JobRoleEnum.areaManager;

      default:
        return JobRoleEnum.sales;
    }
  }
}

extension JobRoleEnumX on JobRoleEnum {
  Map<String, dynamic> toMap() {
    return {'job_role': name};
  }
}

class JobRole implements Filter {
  final JobRoleEnum jobRole;

  JobRole({required this.jobRole});

  @override
  String get label {
    switch (jobRole) {
      case JobRoleEnum.sales:
        return 'Sales';
      case JobRoleEnum.cashier:
        return 'Cashier';
      case JobRoleEnum.inventory:
        return 'Inventory';
      case JobRoleEnum.storeHead:
        return 'Store Head';
      case JobRoleEnum.seniorStoreHead:
        return 'Senior Store Head';
      case JobRoleEnum.areaManager:
        return 'Area Manager';
    }
  }

  static List<JobRole> get jobRoles {
    List<JobRole> result = [];

    for (var role in JobRoleEnum.values) {
      result.add(JobRole(jobRole: role));
    }

    return result;
  }

  @override
  String toString() {
    return label;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobRole': jobRole.toMap(),
    };
  }

  factory JobRole.fromMap(Map<String, dynamic> map) {
    return JobRole(
      jobRole: JobRoleEnum.fromMap((map["jobRole"] ??
          Map<String, dynamic>.from({})) as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory JobRole.fromJson(String source) =>
      JobRole.fromMap(json.decode(source) as Map<String, dynamic>);
}
