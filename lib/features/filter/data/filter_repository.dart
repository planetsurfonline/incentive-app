import 'dart:developer';

import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/filter/data/period_provider.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';

class FilterRepository {
  final PeriodProvider _periodProvider = PeriodProvider();

  Future<List<Period>> getPeriodList() async {
    try {
      final _ = await _periodProvider.getPeriodList();

      // TODO: Change dummy to data from API
      return Dummy.periods;
    } catch (e) {
      log('FilterRepository getPeriodList => ${e.toString()}');

      rethrow;
    }
  }
}
