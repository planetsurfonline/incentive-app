import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/members/data/member_provider.dart';
import 'package:psm_incentive/features/members/domain/member.dart';

class MemberRepository {
  final MemberProvider _provider = MemberProvider();

  Future<List<Member>> getMembers() async {
    try {
      var result = await _provider.getMembers();

      result = Dummy.members;

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Member>> getMembersByFilter(FilterState filter) async {
    try {
      var data = await _provider.getMembersByFilter(filter);

      List<Member> result = Dummy.members;

      if (filter.jobRole != null) {
        result = result
            .where(
              (member) => member.jobRole.jobRole == filter.jobRole!.jobRole,
            )
            .toList();
      }

      if (filter.sortType != null) {
        if (filter.sortType?.sort == SortEnum.lowestToHighest) {
          result.sort(
            (a, b) => a.incentive.amount.compareTo(b.incentive.amount),
          );
        }
        if (filter.sortType?.sort == SortEnum.highestToLowest) {
          result.sort(
            (a, b) => b.incentive.amount.compareTo(a.incentive.amount),
          );
        }
      }

      if (filter.store != null) {
        result = result
            .where(
                (member) => member.store.storeUuid == filter.store!.storeUuid)
            .toList();
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
