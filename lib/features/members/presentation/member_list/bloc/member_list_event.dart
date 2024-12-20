part of 'member_list_bloc.dart';

sealed class MemberListEvent extends Equatable {
  const MemberListEvent();

  @override
  List<Object> get props => [];
}

final class MemberListGetAllMember extends MemberListEvent {}

final class MemberListShowSearched extends MemberListEvent {
  final String searchQuery;

  const MemberListShowSearched({required this.searchQuery});

  @override
  List<Object> get props => [searchQuery];
}
