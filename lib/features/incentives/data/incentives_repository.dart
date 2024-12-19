import 'dart:developer';

import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/incentives/data/incentive_history_provider.dart';
import 'package:psm_incentive/features/incentives/data/incentives_provider.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';
import 'package:psm_incentive/utils/formatter/date_formatter.dart';

class IncentivesRepository {
  final IncentivesProvider _provider = IncentivesProvider();
  final IncentiveHistoryProvider _historyProvider = IncentiveHistoryProvider();

  Future<List<IncentiveData>> getRecentHistory() async {
    try {
      final result = await _historyProvider.getRecentHistoryData();

      // TODO: Convert result to List of History Item
      // return [];
      return Dummy.incentiveList;

      // return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<IncentiveData>> getAllIncentiveHistory() async {
    try {
      final result = await _historyProvider.getRecentHistoryData();

      // TODO: Convert result to List of History Item
      // return [];
      return Dummy.incentiveList;

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

  Future<List<IncentiveData>> getIncentiveHistoryByFilter(
    FilterState filter,
  ) async {
    try {
      final result = await _historyProvider.getIncentiveHistoryByFilter(filter);

      var filteredData = Dummy.incentiveList;

      if (filter.period != null) {
        filteredData = filteredData.where((incentive) {
          return DateFormatter.isDateIsInsideRange(
            incentive.invoiceDate,
            filter.period!.startDate,
            filter.period!.endDate,
          );
        }).toList();
      }

      if (filter.sortType != null) {
        if (filter.sortType?.sort == SortEnum.lowestToHighest) {
          filteredData.sort((a, b) => a.amount.compareTo(b.amount));
        }
        if (filter.sortType?.sort == SortEnum.highestToLowest) {
          filteredData.sort((a, b) => b.amount.compareTo(a.amount));
        }
      }

      return filteredData;
    } catch (e) {
      rethrow;
    }
  }
}
