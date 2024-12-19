import 'package:flutter/material.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

enum MainNavigationEnum {
  home,
  member;

  String label(BuildContext context) {
    switch (this) {
      case MainNavigationEnum.home:
        return context.strings.homeLabel;
      case MainNavigationEnum.member:
        return context.strings.teamMemberListLabel;
    }
  }
}

extension MainNavigationEnumX on MainNavigationEnum {
  Icon get icon {
    switch (this) {
      case MainNavigationEnum.home:
        return const Icon(Icons.home);
      case MainNavigationEnum.member:
        return const Icon(Icons.people);
    }
  }
}
