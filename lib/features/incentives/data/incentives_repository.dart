import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/incentives/data/incentive_history_provider.dart';
import 'package:psm_incentive/features/incentives/data/incentives_provider.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';

class IncentivesRepository {
  final IncentivesProvider _provider = IncentivesProvider();
  final IncentiveHistoryProvider _historyProvider = IncentiveHistoryProvider();

  Future<List<HistoryItem>> getRecentHistory() async {
    try {
      final result = await _historyProvider.getRecentHistoryData();

      // TODO: Convert result to List of History Item
      // return [];
      return Dummy.getHistoryItem();

      // return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<double> getIncentiveData() async {
    try {
      final result = await _provider.getIncentiveData();

      // TODO: Convert result to List of History Item

      return Dummy.incentiveAmount;

      // return result;
    } catch (e) {
      rethrow;
    }
  }
}
