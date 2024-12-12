part of 'incentive_history_bloc.dart';

final class IncentiveHistoryState extends Equatable {
  final Status status;
  final String message;
  final List<Incentive> recentHistories;

  const IncentiveHistoryState({
    this.status = Status.loading,
    this.message = '',
    this.recentHistories = const [],
  });

  IncentiveHistoryState copyWith({
    Status? status,
    String? message,
    List<Incentive>? recentHistories,
  }) {
    return IncentiveHistoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      recentHistories: recentHistories ?? this.recentHistories,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        recentHistories,
      ];
}
