part of 'incentive_bloc.dart';

final class IncentiveState extends Equatable {
  final Status status;
  final String message;

  final double incentiveAmount;

  const IncentiveState({
    this.status = Status.loading,
    this.message = '',
    this.incentiveAmount = 0.0,
  });

  IncentiveState copyWith({
    Status? status,
    String? message,
    double? incentiveAmount,
  }) {
    return IncentiveState(
      status: status ?? this.status,
      message: message ?? this.message,
      incentiveAmount: incentiveAmount ?? this.incentiveAmount,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        incentiveAmount,
      ];
}
