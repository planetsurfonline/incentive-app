part of 'incentive_history_bloc.dart';

final class IncentiveHistoryState extends Equatable {
  final Status status;
  final String message;
  final List<IncentiveData> recentHistories;
  final List<IncentiveData> allHistories;
  final List<IncentiveData> displayedHistories;

  const IncentiveHistoryState({
    this.status = Status.loading,
    this.message = '',
    this.recentHistories = const [],
    this.allHistories = const [],
    this.displayedHistories = const [],
  });

  IncentiveHistoryState copyWith({
    Status? status,
    String? message,
    List<IncentiveData>? recentHistories,
    List<IncentiveData>? allHistories,
    List<IncentiveData>? displayedHistories,
  }) {
    return IncentiveHistoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      recentHistories: recentHistories ?? this.recentHistories,
      allHistories: allHistories ?? this.allHistories,
      displayedHistories: displayedHistories ?? this.displayedHistories,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        recentHistories,
        allHistories,
        displayedHistories,
      ];
}
