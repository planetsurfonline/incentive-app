import 'dart:math';

import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/incentives/domain/history_item.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';

class Dummy {
  static List<HistoryItem> getHistoryItem({int itemCount = 5}) {
    final List<HistoryItem> result = [];
    final Random random = Random();

    for (int i = 0; i < itemCount; i++) {
      final randomInvoiceAndIncentive = random.nextDouble() * 10000;
      final temp = HistoryItem(
        invoiceNumber: 'INV #$randomInvoiceAndIncentive',
        invoiceDate: DateTime.now(),
        incentiveAmount: randomInvoiceAndIncentive,
      );

      result.add(temp);
    }

    return result;
  }

  static double get incentiveAmount {
    final histories = getHistoryItem();

    double amount = 0;

    for (var history in histories) {
      amount += history.incentiveAmount;
    }

    return amount;
  }

  static List<Period> periods = [
    Period(
      name: 'Natal 2024',
      startDate: DateTime(2024, 12, 1, 0, 0, 0),
      endDate: DateTime(2024, 12, 31, 23, 59, 59),
    ),
    Period(
      name: 'Natal 2023',
      startDate: DateTime(2023, 12, 1, 0, 0, 0),
      endDate: DateTime(2023, 12, 31, 23, 59, 59),
    ),
    Period(
      name: 'Tahun Baru 2024',
      startDate: DateTime(2024, 1, 1, 0, 0, 0),
      endDate: DateTime(2024, 1, 31, 23, 59, 59),
    ),
    Period(
      name: 'Tahun Baru 2023',
      startDate: DateTime(2023, 1, 1, 0, 0, 0),
      endDate: DateTime(2023, 1, 31, 23, 59, 59),
    ),
    Period(
      name: 'Imlek 2024',
      startDate: DateTime(2024, 2, 1, 0, 0, 0),
      endDate: DateTime(2024, 2, 31, 23, 59, 59),
    ),
    Period(
      name: 'Imlek 2023',
      startDate: DateTime(2023, 2, 1, 0, 0, 0),
      endDate: DateTime(2023, 2, 28, 23, 59, 59),
    ),
    Period(
      name: 'Lebaran 2023',
      startDate: DateTime(2023, 3, 1, 0, 0, 0),
      endDate: DateTime(2023, 3, 31, 23, 59, 59),
    ),
  ];
}
