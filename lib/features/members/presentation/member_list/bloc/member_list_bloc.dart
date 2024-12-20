import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/dummy/dummy.dart';
import 'package:psm_incentive/features/members/domain/models.dart';
import 'package:psm_incentive/shared/enum/status.dart';

part 'member_list_event.dart';
part 'member_list_state.dart';

class MemberListBloc extends Bloc<MemberListEvent, MemberListState> {
  MemberListBloc() : super(const MemberListState()) {
    on<MemberListGetAllMember>(_onMemberListGetAllMember);

    on<MemberListShowSearched>(_onMemberListShowSearched);
  }

  Future<void> _onMemberListGetAllMember(
    _,
    Emitter<MemberListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Get data from repository
      final List<Member> memberList = Dummy.members;

      emit(state.copyWith(
        memberList: memberList,
        displayedMemberList: memberList,
        status: Status.success,
      ));
    } catch (e) {
      log('MemberListBloc _onMemberListGetAllMember =/ ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: '',
      ));
    }
  }

  void _onMemberListShowSearched(
    MemberListShowSearched event,
    Emitter<MemberListState> emit,
  ) {
    final displayedList = state.memberList
        .where((member) =>
            member.fullname.toLowerCase().contains(event.searchQuery))
        .toList();

    emit(state.copyWith(
      displayedMemberList: displayedList,
    ));
  }
}
