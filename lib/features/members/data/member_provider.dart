import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';

class MemberProvider {
  final String apiUrl = 'https://api.example.com/members';

  // Function to get list of members
  Future<dynamic> getMembers() async {
    try {
      return '{}';
    } catch (e) {
      rethrow;
    }
  }

  // Function to get list of members by filter
  Future<dynamic> getMembersByFilter(FilterState filter) async {
    try {
      return '{}';
    } catch (e) {
      rethrow;
    }
  }
}
