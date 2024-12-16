import 'dart:developer';

import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/filter/data/period_provider.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/store/data/store_repository.dart';
import 'package:psm_incentive/features/store/domain/models.dart';

class FilterRepository {
  // TODO: Move period to separate feature
  final PeriodProvider _periodProvider = PeriodProvider();
  final StoreRepository _storeRepository = StoreRepository();

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

  Future<List<Store>> getStoreList() async {
    try {
      final result = await _storeRepository.getStoreList();

      return result;
    } catch (e) {
      log('FilterRepository getPeriodList => ${e.toString()}');

      rethrow;
    }
  }
}
