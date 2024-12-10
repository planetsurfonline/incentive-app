part of 'incentive_history_bloc.dart';

final class IncentiveHistoryState extends Equatable {
  final Status status;
  final String message;
  final List<HistoryItem> recentHistories;

  const IncentiveHistoryState({
    this.status = Status.loading,
    this.message = '',
    this.recentHistories = const [],
  });

  IncentiveHistoryState copyWith({
    Status? status,
    String? message,
    List<HistoryItem>? recentHistories,
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
