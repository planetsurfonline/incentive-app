part of 'incentive_history_bloc.dart';

sealed class IncentiveHistoryEvent extends Equatable {
  const IncentiveHistoryEvent();

  @override
  List<Object> get props => [];
}

final class IncentiveHistoryGetRecentData extends IncentiveHistoryEvent {}

final class IncentiveHistoryGetHistoryData extends IncentiveHistoryEvent {}

final class IncentiveHistoryFilterDisplay extends IncentiveHistoryEvent {
  final String searchQuery;

  const IncentiveHistoryFilterDisplay({required this.searchQuery});

  @override
  List<Object> get props => [searchQuery];
}
