part of 'member_list_bloc.dart';

final class MemberListState extends Equatable {
  final Status status;
  const MemberListState({this.status = Status.loading});

  @override
  List<Object> get props => [status];
}
