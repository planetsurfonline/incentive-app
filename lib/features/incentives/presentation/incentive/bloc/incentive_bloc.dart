import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/features/incentives/data/incentives_repository.dart';
import 'package:psm_incentive/shared/enum/status.dart';

part 'incentive_event.dart';
part 'incentive_state.dart';

class IncentiveBloc extends Bloc<IncentiveEvent, IncentiveState> {
  final IncentivesRepository _repository;

  IncentiveBloc({
    required IncentivesRepository repository,
  })  : _repository = repository,
        super(const IncentiveState()) {
    on<IncentiveGetAmountData>(_onIncentiveGetAmountData);
  }

  Future<void> _onIncentiveGetAmountData(
    _,
    Emitter<IncentiveState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final double items = await _repository.getIncentiveData();

      emit(state.copyWith(
        status: Status.success,
        incentiveAmount: items,
      ));
    } catch (e) {
      log('IncentiveBloc _onIncentiveGetAmountData => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: 'Cannot load data. Please try again',
      ));
    }
  }
}
