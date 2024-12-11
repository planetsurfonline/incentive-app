import 'dart:developer';

class PeriodProvider {
  Future<dynamic> getPeriodList() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return '';
    } catch (e) {
      log('PeriodProvider getPeriodList => ${e.toString()}');

      rethrow;
    }
  }
}
