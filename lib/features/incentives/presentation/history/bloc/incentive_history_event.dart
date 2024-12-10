part of 'incentive_history_bloc.dart';

sealed class IncentiveHistoryEvent extends Equatable {
  const IncentiveHistoryEvent();

  @override
  List<Object> get props => [];
}

final class IncentiveHistoryGetRecentData extends IncentiveHistoryEvent {}
