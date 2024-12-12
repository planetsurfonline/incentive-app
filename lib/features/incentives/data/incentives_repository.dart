import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/incentives/data/incentive_history_provider.dart';
import 'package:psm_incentive/features/incentives/data/incentives_provider.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';

class IncentivesRepository {
  final IncentivesProvider _provider = IncentivesProvider();
  final IncentiveHistoryProvider _historyProvider = IncentiveHistoryProvider();

  Future<List<Incentive>> getRecentHistory() async {
    try {
      final result = await _historyProvider.getRecentHistoryData();

      // TODO: Convert result to List of History Item
      // return [];
      return Dummy.getIncentiveRecords();

      // return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Incentive>> getAllIncentiveHistory() async {
    try {
      final result = await _historyProvider.getRecentHistoryData();

      // TODO: Convert result to List of History Item
      // return [];
      return Dummy.getIncentiveRecords(itemCount: 10);

      // return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<double> getIncentiveData() async {
    try {
      final result = await _provider.getIncentiveData();

      // TODO: Convert result to List of History Item

      return Dummy.amount;

      // return result;
    } catch (e) {
      rethrow;
    }
  }
}
