part of 'member_list_bloc.dart';

final class MemberListState extends Equatable {
  final Status status;
  final String message;
  final List<Member> memberList;
  final List<Member> displayedMemberList;

  const MemberListState({
    this.status = Status.loading,
    this.message = '',
    this.memberList = const [],
    this.displayedMemberList = const [],
  });

  MemberListState copyWith({
    Status? status,
    String? message,
    List<Member>? memberList,
    List<Member>? displayedMemberList,
  }) {
    return MemberListState(
      status: status ?? this.status,
      message: message ?? this.message,
      memberList: memberList ?? this.memberList,
      displayedMemberList: displayedMemberList ?? this.displayedMemberList,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        memberList,
        displayedMemberList,
      ];
}
