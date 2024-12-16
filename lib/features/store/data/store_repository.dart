import 'dart:developer';

import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/store/data/store_provider.dart';
import 'package:psm_incentive/features/store/domain/models.dart';

class StoreRepository {
  final StoreProvider _provider = StoreProvider();

  Future<List<Store>> getStoreList() async {
    try {
      final _ = await _provider.getStoreList();

      return Dummy.storeList;
    } catch (e) {
      log('FilterRepository getPeriodList => ${e.toString()}');

      rethrow;
    }
  }
}
