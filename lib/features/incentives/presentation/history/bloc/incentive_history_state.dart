part of 'incentive_history_bloc.dart';

final class IncentiveHistoryState extends Equatable {
  final Status status;
  final String message;
  final List<Incentive> recentHistories;
  final List<Incentive> allHistories;

  const IncentiveHistoryState({
    this.status = Status.loading,
    this.message = '',
    this.recentHistories = const [],
    this.allHistories = const [],
  });

  IncentiveHistoryState copyWith({
    Status? status,
    String? message,
    List<Incentive>? recentHistories,
    List<Incentive>? allHistories,
  }) {
    return IncentiveHistoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      recentHistories: recentHistories ?? this.recentHistories,
      allHistories: allHistories ?? this.allHistories,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        recentHistories,
        allHistories,
      ];
}
