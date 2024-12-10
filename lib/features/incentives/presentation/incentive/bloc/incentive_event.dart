part of 'incentive_bloc.dart';

sealed class IncentiveEvent extends Equatable {
  const IncentiveEvent();

  @override
  List<Object> get props => [];
}

final class IncentiveGetAmountData extends IncentiveEvent {}
