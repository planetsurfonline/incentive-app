import 'dart:math';

import 'package:psm_incentive/features/incentives/domain/history_item.dart';

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
}
