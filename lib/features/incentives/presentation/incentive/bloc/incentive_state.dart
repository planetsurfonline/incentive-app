part of 'incentive_bloc.dart';

final class IncentiveState extends Equatable {
  final Status status;
  final String message;

  final double amount;

  const IncentiveState({
    this.status = Status.loading,
    this.message = '',
    this.amount = 0.0,
  });

  IncentiveState copyWith({
    Status? status,
    String? message,
    double? amount,
  }) {
    return IncentiveState(
      status: status ?? this.status,
      message: message ?? this.message,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        amount,
      ];
}
