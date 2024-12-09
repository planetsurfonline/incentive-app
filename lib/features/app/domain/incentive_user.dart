import 'package:psm_incentive/features/app/domain/models.dart';

class IncentiveUser {
  String uuid;
  String operatorName;
  Role role;

  IncentiveUser({
    required this.uuid,
    required this.operatorName,
    required this.role,
  });

  String get operatorInitials {
    final fullName = operatorName.trim();

    List<String> names = fullName.split(' ');

    if (names.length > 1) {
      String initials = names.first[0] + names.last[0];
      return initials.toUpperCase();
    } else if (names.isNotEmpty) {
      return names.first[0].toUpperCase();
    } else {
      return '';
    }
  }

  factory IncentiveUser.fromJson(Map<String, dynamic> json) {
    return IncentiveUser(
      uuid: json['uuid'],
      operatorName: json['operatorName'],
      role: Role.getRole(json['role']),
    );
  }
}
