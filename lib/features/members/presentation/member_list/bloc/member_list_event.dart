part of 'member_list_bloc.dart';

sealed class MemberListEvent extends Equatable {
  const MemberListEvent();

  @override
  List<Object> get props => [];
}

final class MemberListGetAllMember extends MemberListEvent {}
