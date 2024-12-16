import 'package:psm_incentive/features/filter/domain/models.dart';

enum SortEnum { highestToLowest, lowestToHighest }

class SortType implements Filter {
  final SortEnum sort;

  SortType({required this.sort});

  @override
  String get label {
    switch (sort) {
      case SortEnum.highestToLowest:
        return 'High - Low';
      case SortEnum.lowestToHighest:
        return 'Low - High';
    }
  }

  static List<SortType> get sortList {
    List<SortType> result = [];

    for (var sort in SortEnum.values) {
      result.add(SortType(sort: sort));
    }

    return result;
  }

  @override
  String toString() {
    return label;
  }
}
