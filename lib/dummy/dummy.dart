import 'dart:math';

import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';
import 'package:psm_incentive/features/members/domain/models.dart';
import 'package:psm_incentive/features/store/domain/models.dart';

class Dummy {
  static List<IncentiveData> getIncentiveRecords({int itemCount = 5}) {
    final List<IncentiveData> result = [];
    final Random random = Random();

    final now = DateTime.now();

    final randomInvoiceAndIncentive = random.nextDouble() * 10000;
    final todaysRecord = IncentiveData(
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

      final temp = IncentiveData(
        invoiceNumber: 'INV #$randomInvoiceAndIncentive',
        invoiceDate: randomDateTime,
        amount: randomInvoiceAndIncentive,
      );

      result.add(temp);
    }

    result.sort((a, b) => a.invoiceDate.isBefore(b.invoiceDate) ? 1 : -1);

    return result;
  }

  static List<IncentiveData> generateIncentiveList({int itemCount = 5}) {
    final List<IncentiveData> result = [];
    final Random random = Random();

    final now = DateTime.now();

    final randomIncentiveAmount = random.nextDouble() * 10000;
    final randomInvoiceNumber = random.nextInt(9999999) + 1000000;
    final todaysRecord = IncentiveData(
      invoiceNumber: 'INV #$randomInvoiceNumber',
      invoiceDate: now,
      amount: randomIncentiveAmount,
    );

    result.add(todaysRecord);

    for (int i = 0; i < itemCount; i++) {
      final randomIncentiveAmount = random.nextDouble() * 10000;
      final randomInvoiceNumber = random.nextInt(9999999) + 1000000;

      final randomDate = random.nextInt(28);
      final randomMonth = random.nextInt(12);
      final randomDateTime = DateTime(now.year, randomMonth, randomDate);

      if (randomDateTime.month == now.month && randomDateTime.day == now.day) {
        i--;
        continue;
      }

      final temp = IncentiveData(
        invoiceNumber: 'INV #$randomInvoiceNumber',
        invoiceDate: randomDateTime,
        amount: randomIncentiveAmount,
      );

      result.add(temp);
    }

    result.sort((a, b) => a.invoiceDate.isBefore(b.invoiceDate) ? 1 : -1);

    return result;
  }

  static List<IncentiveData> incentiveList = [
    IncentiveData(
      invoiceNumber: "INV #4401961",
      invoiceDate: DateTime.parse("2024-12-18 10:50:25.221398"),
      amount: 9192.516974893973,
    ),
    IncentiveData(
      invoiceNumber: "INV #9967342",
      invoiceDate: DateTime.parse("2024-09-24 00:00:00.000"),
      amount: 1554.370908060194,
    ),
    IncentiveData(
      invoiceNumber: "INV #8922289",
      invoiceDate: DateTime.parse("2024-07-27 00:00:00.000"),
      amount: 344.6961915646818,
    ),
    IncentiveData(
      invoiceNumber: "INV #9016819",
      invoiceDate: DateTime.parse("2024-06-08 00:00:00.000"),
      amount: 5467.660350285959,
    ),
    IncentiveData(
      invoiceNumber: "INV #5550352",
      invoiceDate: DateTime.parse("2024-04-27 00:00:00.000"),
      amount: 1351.206004952451,
    ),
    IncentiveData(
      invoiceNumber: "INV #4301462",
      invoiceDate: DateTime.parse("2024-04-26 00:00:00.000"),
      amount: 2885.6085210448746,
    ),
    IncentiveData(
      invoiceNumber: "INV #9616595",
      invoiceDate: DateTime.parse("2024-04-14 00:00:00.000"),
      amount: 5949.52337468577,
    ),
    IncentiveData(
      invoiceNumber: "INV #9777392",
      invoiceDate: DateTime.parse("2024-04-01 00:00:00.000"),
      amount: 2294.740659586251,
    ),
    IncentiveData(
      invoiceNumber: "INV #9906477",
      invoiceDate: DateTime.parse("2024-01-15 00:00:00.000"),
      amount: 4272.576066942213,
    ),
    IncentiveData(
      invoiceNumber: "INV #5914967",
      invoiceDate: DateTime.parse("2023-12-17 00:00:00.000"),
      amount: 554.4931793754382,
    ),
    IncentiveData(
      invoiceNumber: "INV #9389548",
      invoiceDate: DateTime.parse("2023-12-07 00:00:00.000"),
      amount: 1481.879528947777,
    ),
  ];

  static double get amount {
    final histories = incentiveList;

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

  static List<Store> storeList = [
    const Store(storeName: 'PS ACEH', storeUuid: 'PSACEH'),
    const Store(storeName: 'PS ACEH2', storeUuid: 'PSACEH'),
    const Store(storeName: 'PS ADIYAKSA', storeUuid: 'PSADIYAKSA'),
    const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
    const Store(storeName: 'PS AMBON', storeUuid: 'PSAMBON'),
    const Store(storeName: 'PS TERNATE', storeUuid: 'PSTERNATE'),
    const Store(storeName: 'PS JAKARTA', storeUuid: 'PSJAKARTA'),
    const Store(storeName: 'PS TANGERANG', storeUuid: 'PSTANGERANG'),
    const Store(storeName: 'PS BALI', storeUuid: 'PSBALI'),
    const Store(storeName: 'PS BALI2', storeUuid: 'PSBALI2'),
    const Store(storeName: 'PS BALI3', storeUuid: 'PSBALI3'),
    const Store(storeName: 'PS KUTA', storeUuid: 'PSKUTA'),
    const Store(storeName: 'PS PEKANBARU', storeUuid: 'PSPEKANBARU'),
    const Store(storeName: 'PS SINGKAWANG', storeUuid: 'PSSINGKAWANG'),
    const Store(storeName: 'PS BANJARMASIN', storeUuid: 'PSBANJARMASIN'),
    const Store(storeName: 'PS BANDUNG', storeUuid: 'PSBANDUNG'),
  ];

  static final List<Member> members = [
    Member(
      fullname: 'Almayra',
      jobRole: JobRole(jobRole: JobRoleEnum.sales),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 250000),
    ),
    Member(
      fullname: 'James Christian Wira',
      jobRole: JobRole(jobRole: JobRoleEnum.areaManager),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 290000),
    ),
    Member(
      fullname: 'Handriki Kasa',
      jobRole: JobRole(jobRole: JobRoleEnum.storeHead),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 220000),
    ),
    Member(
      fullname: 'Matthew Evans',
      jobRole: JobRole(jobRole: JobRoleEnum.seniorStoreHead),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 210000),
    ),
    Member(
      fullname: 'Willy Wilsen',
      jobRole: JobRole(jobRole: JobRoleEnum.cashier),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 260000),
    ),
    Member(
      fullname: 'Fikri Raihan',
      jobRole: JobRole(jobRole: JobRoleEnum.inventory),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 270000),
    ),
    Member(
      fullname: 'Farhan Hafizh',
      jobRole: JobRole(jobRole: JobRoleEnum.sales),
      store: const Store(storeName: 'PS PAKU', storeUuid: 'PSPAKU'),
      incentive: Incentive(amount: 220000),
    ),
    Member(
      fullname: 'Gusti Anugrah Harimurti',
      jobRole: JobRole(jobRole: JobRoleEnum.sales),
      store: const Store(storeName: 'PS BALI', storeUuid: 'PSBALI'),
      incentive: Incentive(amount: 250000),
    ),
    Member(
      fullname: 'Yudi Pratama',
      jobRole: JobRole(jobRole: JobRoleEnum.areaManager),
      store: const Store(storeName: 'PS BALI', storeUuid: 'PSBALI'),
      incentive: Incentive(amount: 290000),
    ),
    Member(
      fullname: 'Denis Prawira',
      jobRole: JobRole(jobRole: JobRoleEnum.storeHead),
      store: const Store(storeName: 'PS BALI', storeUuid: 'PSBALI'),
      incentive: Incentive(amount: 220000),
    ),
    Member(
      fullname: 'Adi Saputra',
      jobRole: JobRole(jobRole: JobRoleEnum.inventory),
      store: const Store(storeName: 'PS BALI', storeUuid: 'PSBALI'),
      incentive: Incentive(amount: 210000),
    ),
    Member(
      fullname: 'Putu Wirawan',
      jobRole: JobRole(jobRole: JobRoleEnum.cashier),
      store: const Store(storeName: 'PS BALI', storeUuid: 'PSBALI'),
      incentive: Incentive(amount: 260000),
    ),
  ];
}
