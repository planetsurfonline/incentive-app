import 'dart:convert';

import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';

class IncentiveHistoryProvider {
  Future<dynamic> getRecentHistoryData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Update path to the corresponding path
      // const path = '';

      // TODO: Implement get API

      return jsonDecode('{}');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAllIncentiveHistory() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Update path to the corresponding path
      // const path = '';

      // TODO: Implement get API

      return jsonDecode('{}');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getIncentiveHistoryByFilter(FilterState? filter) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Update path to the corresponding path
      // const path = '';

      // TODO: Implement get API

      return jsonDecode('{}');
    } catch (e) {
      rethrow;
    }
  }
}
