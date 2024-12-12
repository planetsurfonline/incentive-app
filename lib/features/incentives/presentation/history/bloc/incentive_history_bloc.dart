import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psm_incentive/features/incentives/data/incentives_repository.dart';
import 'package:psm_incentive/features/incentives/domain/models.dart';
import 'package:psm_incentive/shared/enum/status.dart';

part 'incentive_history_event.dart';
part 'incentive_history_state.dart';

class IncentiveHistoryBloc
    extends Bloc<IncentiveHistoryEvent, IncentiveHistoryState> {
  final IncentivesRepository _repository;

  IncentiveHistoryBloc({
    required IncentivesRepository repository,
  })  : _repository = repository,
        super(const IncentiveHistoryState()) {
    on<IncentiveHistoryGetRecentData>(_onIncentiveHistoryGetRecentData);
  }

  Future<void> _onIncentiveHistoryGetRecentData(
    _,
    Emitter<IncentiveHistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final List<Incentive> items = await _repository.getRecentHistory();

      emit(state.copyWith(
        status: Status.success,
        recentHistories: items,
      ));
    } catch (e) {
      log('IncentiveHistoryBloc _onIncentiveHistoryGetRecentData => ${e.toString()}');

      emit(state.copyWith(
        status: Status.error,
        message: 'Cannot load data. Please try again',
      ));
    }
  }
}
