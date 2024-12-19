import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/shared/enum/status.dart';

part 'member_list_event.dart';
part 'member_list_state.dart';

class MemberListBloc extends Bloc<MemberListEvent, MemberListState> {
  MemberListBloc() : super(const MemberListState()) {
    on<MemberListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
