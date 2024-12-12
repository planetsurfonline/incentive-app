import 'dart:math';
import 'dart:developer' as dev;

import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/incentives/domain/incentive.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';

class Dummy {
  static List<Incentive> getIncentiveRecords({int itemCount = 5}) {
    final List<Incentive> result = [];
    final Random random = Random();

    final now = DateTime.now();

    final randomInvoiceAndIncentive = random.nextDouble() * 10000;
    final todaysRecord = Incentive(
      invoiceNumber: 'INV #$randomInvoiceAndIncentive',
      invoiceDate: now,
      amount: randomInvoiceAndIncentive,
    );

    result.add(todaysRecord);

    for (int i = 0; i < itemCount; i++) {
      final randomInvoiceAndIncentive = random.nextDouble() * 10000;
      final randomDate = random.nextInt(28);
      final randomMonth = random.nextInt(12);
      final randomDateTime = DateTime(now.year, randomMonth, randomDate);

      if (randomDateTime.month == now.month && randomDateTime.day == now.day) {
        i--;
        continue;
      }

      final temp = Incentive(
        invoiceNumber: 'INV #$randomInvoiceAndIncentive',
        invoiceDate: randomDateTime,
        amount: randomInvoiceAndIncentive,
      );

      result.add(temp);
    }

    result.sort((a, b) => a.invoiceDate.isBefore(b.invoiceDate) ? 1 : -1);

    return result;
  }

  static double get amount {
    final histories = getIncentiveRecords();

    double amount = 0;

    for (var history in histories) {
      amount += history.amount;
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
