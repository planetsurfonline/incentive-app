import 'dart:convert';

class IncentivesProvider {
  Future<dynamic> getIncentiveData() async {
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
