import 'package:psm_incentive/features/filter/domain/models.dart';

enum JobRoleEnum {
  sales,
  cashier,
  inventory,
  storeHead,
  seniorStoreHead,
  areaManager,
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
}
