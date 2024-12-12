import 'dart:convert';

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
}
