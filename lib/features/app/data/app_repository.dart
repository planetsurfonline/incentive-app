import 'dart:convert';

import 'package:psm_incentive/features/app/data/app_provider.dart';
import 'package:psm_incentive/features/app/domain/models.dart';

class AppRepository {
  final AppProvider _provider = AppProvider();

  Future<IncentiveUser?> getUserData() async {
    try {
      final result = await _provider.getUserData();
      final resultJson = jsonDecode(result.toString());

      // TODO: mae audit user from resultJson
      IncentiveUser user = IncentiveUser.fromJson(resultJson);

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
